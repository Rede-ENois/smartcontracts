#!/usr/bin/env bash
#
# Instala o toolchain de documentação: mermaid-cli via NVM (Node 22) e
# verifica pandoc, wkhtmltopdf e Google Chrome.
#
# A versão do mermaid-cli instalada é a mais recente publicada há pelo
# menos 7 dias (política de supply chain do projeto).
#
# Author:  Carlos Delfino
# Email:   consultoria@carlosdelfino.eti.br
# WhatsApp: +55 (85) 98520-5490
#
# Uso:
#   ./scripts/docs/install-docs-toolchain.sh
#
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"
export MIN_AGE_DAYS="${MIN_AGE_DAYS:-7}"

ts() { date '+%Y-%m-%d %H:%M:%S'; }
log() { echo "[$(ts)] [$(basename "$0"):main:$LINENO] INFO $*"; }
err() { echo "[$(ts)] [$(basename "$0"):main:$LINENO] ERROR $*" >&2; }

activate_node() {
    export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
    if [ ! -s "$NVM_DIR/nvm.sh" ]; then
        err "NVM não encontrado em $NVM_DIR — instale o NVM antes de continuar."
        exit 1
    fi
    # shellcheck disable=SC1091
    . "$NVM_DIR/nvm.sh"

    local wanted="22"
    [ -f "$REPO_ROOT/.nvmrc" ] && wanted="$(cat "$REPO_ROOT/.nvmrc" | tr -d 'v[:space:]')"

    if ! nvm ls "$wanted" >/dev/null 2>&1 || [ -z "$(nvm ls "$wanted" 2>/dev/null | grep -v 'N/A' || true)" ]; then
        log "instalando Node $wanted via NVM"
        nvm install "$wanted"
    fi
    nvm use "$wanted" >/dev/null
    log "node=$(node -v) npm=$(npm -v)"
}

check_system_deps() {
    local missing=0
    for dep in pandoc wkhtmltopdf python3; do
        if command -v "$dep" >/dev/null 2>&1; then
            log "ok: $dep -> $(command -v "$dep")"
        else
            err "ausente: $dep (instale via apt: sudo apt install pandoc wkhtmltopdf python3)"
            missing=1
        fi
    done
    if [ -x /usr/bin/google-chrome ]; then
        log "ok: google-chrome -> /usr/bin/google-chrome"
    else
        err "ausente: /usr/bin/google-chrome (necessário ao mermaid-cli; ajuste scripts/docs/puppeteer-config.json)"
        missing=1
    fi
    [ "$missing" -eq 0 ] || exit 1
}

install_mermaid_cli() {
    # Seleciona a versão mais recente publicada há MIN_AGE_DAYS ou mais.
    local version
    version="$(node -e '
        const { execSync } = require("child_process");
        const time = JSON.parse(execSync("npm view @mermaid-js/mermaid-cli time --json").toString());
        const cutoff = Date.now() - Number(process.env.MIN_AGE_DAYS) * 86400e3;
        const cand = Object.entries(time)
            .filter(([v, t]) => v !== "created" && v !== "modified" && new Date(t).getTime() <= cutoff)
            .map(([v]) => v)
            .sort((a, b) => new Date(time[a]) - new Date(time[b]));
        console.log(cand[cand.length - 1] || "");
    ')"

    if [ -z "$version" ]; then
        err "não foi possível determinar versão estável do mermaid-cli"
        exit 1
    fi

    log "instalando @mermaid-js/mermaid-cli@$version (publicada há ≥ ${MIN_AGE_DAYS}d)"
    npm install -g "@mermaid-js/mermaid-cli@$version"
    log "mmdc instalado -> $(command -v mmdc) ($(mmdc --version 2>/dev/null || echo 'versão n/d'))"
}

main() {
    activate_node
    check_system_deps
    install_mermaid_cli
    log "toolchain de documentação pronto. Gere os PDFs com: ./scripts/docs/md-to-pdf.sh docs/analise docs/analise/pdf"
}

main "$@"
