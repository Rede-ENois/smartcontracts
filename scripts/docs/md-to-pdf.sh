#!/usr/bin/env bash
#
# Converte arquivos Markdown em PDF com diagramas Mermaid renderizados.
#
# Pipeline por arquivo: extrai blocos ```mermaid via render_mermaid.py,
# renderiza PNGs com mermaid-cli (mmdc) e converte o markdown processado
# em PDF com pandoc + wkhtmltopdf.
#
# Author:  Carlos Delfino
# Email:   consultoria@carlosdelfino.eti.br
# WhatsApp: +55 (85) 98520-5490
#
# Uso:
#   ./scripts/docs/md-to-pdf.sh [INPUT] [OUTPUT_DIR]
#
#   INPUT        arquivo .md ou diretório com .md (padrão: docs/analise)
#   OUTPUT_DIR   destino dos PDFs (padrão: <INPUT>/pdf)
#
# Dependências: pandoc, wkhtmltopdf, mmdc (mermaid-cli), python3.
# Instalação: ./scripts/docs/install-docs-toolchain.sh
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
PUPPETEER_CFG="$SCRIPT_DIR/puppeteer-config.json"
CSS_FILE="$SCRIPT_DIR/pdf-style.css"

INPUT="${1:-$REPO_ROOT/docs/analise}"
OUTPUT_DIR="${2:-}"
SCALE="${MERMAID_SCALE:-3}"

ts() { date '+%Y-%m-%d %H:%M:%S'; }
log() { echo "[$(ts)] [$(basename "$0"):main:$LINENO] INFO $*"; }
err() { echo "[$(ts)] [$(basename "$0"):main:$LINENO] ERROR $*" >&2; }

# Ativa o Node do NVM (Node 22) para garantir o mmdc correto,
# conforme .devin/rules/smartcontracts-node.md.
activate_node() {
    export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
    # shellcheck disable=SC1091
    if [ -s "$NVM_DIR/nvm.sh" ]; then
        . "$NVM_DIR/nvm.sh"
        if [ -f "$REPO_ROOT/.nvmrc" ]; then
            nvm use --silent >/dev/null 2>&1 || nvm use --silent "$(cat "$REPO_ROOT/.nvmrc")" >/dev/null
        fi
    fi
}

check_deps() {
    local missing=0
    for dep in pandoc wkhtmltopdf python3; do
        if ! command -v "$dep" >/dev/null 2>&1; then
            err "dependência ausente: $dep"
            missing=1
        fi
    done
    if ! command -v mmdc >/dev/null 2>&1; then
        err "mermaid-cli (mmdc) não encontrado — execute ./scripts/docs/install-docs-toolchain.sh"
        missing=1
    fi
    [ "$missing" -eq 0 ] || exit 1
}

convert_one() {
    local md="$1" outdir="$2"
    local stem builddir pdf
    stem="$(basename "$md" .md)"
    builddir="$outdir/.build/$stem"
    pdf="$outdir/$stem.pdf"

    mkdir -p "$builddir"
    log "renderizando mermaid - file=$stem.md"
    python3 "$SCRIPT_DIR/render_mermaid.py" "$md" \
        --outdir "$builddir" \
        --puppeteer-config "$PUPPETEER_CFG" \
        --scale "$SCALE"

    log "gerando PDF - file=$stem.pdf"
    pandoc "$builddir/processed.md" \
        --from markdown+smart \
        --to html \
        --standalone \
        --css "$CSS_FILE" \
        --metadata "pagetitle=$stem" \
        --metadata "lang=pt-BR" \
        --toc --toc-depth=2 \
        --pdf-engine=wkhtmltopdf \
        --pdf-engine-opt=--enable-local-file-access \
        --pdf-engine-opt=--encoding \
        --pdf-engine-opt=UTF-8 \
        -V margin-top=18 -V margin-bottom=18 -V margin-left=14 -V margin-right=14 \
        --resource-path "$builddir" \
        -o "$pdf"

    log "PDF gerado - path=$pdf"
}

main() {
    activate_node
    check_deps

    if [ -z "$OUTPUT_DIR" ]; then
        if [ -d "$INPUT" ]; then
            OUTPUT_DIR="$INPUT/pdf"
        else
            OUTPUT_DIR="$(dirname "$INPUT")/pdf"
        fi
    fi
    mkdir -p "$OUTPUT_DIR"

    local count=0
    if [ -d "$INPUT" ]; then
        shopt -s nullglob
        for md in "$INPUT"/*.md; do
            convert_one "$md" "$OUTPUT_DIR"
            count=$((count + 1))
        done
        shopt -u nullglob
    elif [ -f "$INPUT" ]; then
        convert_one "$INPUT" "$OUTPUT_DIR"
        count=1
    else
        err "entrada não encontrada: $INPUT"
        exit 1
    fi

    log "concluído - pdfs=$count outdir=$OUTPUT_DIR"
    [ "$count" -gt 0 ] || { err "nenhum .md encontrado em $INPUT"; exit 1; }
}

main "$@"
