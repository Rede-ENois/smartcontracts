#!/usr/bin/env python3
"""
Pré-processador de Markdown: renderiza blocos ```mermaid em PNG e gera uma
versão do documento pronta para conversão em PDF via pandoc.

O script extrai cada bloco de diagrama Mermaid para um arquivo `.mmd`,
invoca o `mmdc` (mermaid-cli) para renderizá-lo como PNG e reescreve o
markdown substituindo os blocos por referências de imagem. Imagens remotas
(banners capsule-render e badges externos) são removidas na saída PDF, pois
não renderizam de forma confiável em engines locais como wkhtmltopdf.

Author:  Carlos Delfino
Email:   consultoria@carlosdelfino.eti.br
WhatsApp: +55 (85) 98520-5490

Usage:
    python3 render_mermaid.py INPUT.md --outdir DIR \
        [--mmdc mmdc] [--puppeteer-config FILE] [--scale 3]

Args:
    input: caminho do arquivo .md de origem.
    --outdir: diretório de saída (recebe processed.md e os PNGs).
    --mmdc: executável do mermaid-cli (padrão: "mmdc" no PATH).
    --puppeteer-config: JSON de configuração do Puppeteer/Chrome.
    --scale: fator de escala do PNG (padrão: 3, ~300dpi em docs impressos).

Returns:
    0 em sucesso; 1 em falha de leitura/render/escrita.

Raises:
    SystemExit: quando mmdc falha ou o input não existe.
"""

from __future__ import annotations

import argparse
import logging
import re
import subprocess
import sys
from pathlib import Path

LOG_FORMAT = "[%(asctime)s] [%(name)s:%(funcName)s:%(lineno)d] %(levelname)s %(message)s"
logging.basicConfig(level=logging.INFO, format=LOG_FORMAT, datefmt="%Y-%m-%d %H:%M:%S")
log = logging.getLogger(Path(__file__).name)

MERMAID_BLOCK_RE = re.compile(r"```mermaid[^\n]*\n(.*?)```", re.DOTALL)
REMOTE_IMAGE_RE = re.compile(r"!\[[^\]]*\]\(https?://[^)\s]+[^)]*\)\s*\n?")


def extract_blocks(text: str) -> list[str]:
    """Return the list of mermaid diagram sources found in *text*."""
    return [m.group(1).strip() for m in MERMAID_BLOCK_RE.finditer(text)]


def render_block(mmdc: str, mmd_path: Path, png_path: Path, cfg: Path | None, scale: int) -> None:
    """Render one .mmd file to PNG via mermaid-cli."""
    cmd = [mmdc, "-i", str(mmd_path), "-o", str(png_path), "-b", "white", "-s", str(scale), "-q"]
    if cfg:
        cmd += ["-p", str(cfg)]
    log.info("rendering diagram - file=%s", png_path.name)
    result = subprocess.run(cmd, capture_output=True, text=True, timeout=120)
    if result.returncode != 0 or not png_path.exists():
        log.error("mmdc failed - file=%s stderr=%s", mmd_path.name, result.stderr.strip()[:500])
        raise SystemExit(1)


def process(input_path: Path, outdir: Path, mmdc: str, cfg: Path | None, scale: int) -> Path:
    """
    Render all mermaid blocks of *input_path* and write the processed markdown.

    Args:
        input_path: source .md file.
        outdir: directory that receives processed.md and PNG assets.
        mmdc: mermaid-cli executable name/path.
        cfg: optional puppeteer config JSON.
        scale: PNG scale factor.

    Returns:
        Path to the generated processed markdown file.
    """
    text = input_path.read_text(encoding="utf-8")
    stem = input_path.stem
    outdir.mkdir(parents=True, exist_ok=True)

    blocks = extract_blocks(text)
    log.info("mermaid blocks found - file=%s count=%d", input_path.name, len(blocks))

    idx = 0

    def _replace(match: re.Match) -> str:
        nonlocal idx
        idx += 1
        mmd = outdir / f"{stem}-{idx:02d}.mmd"
        png = outdir / f"{stem}-{idx:02d}.png"
        mmd.write_text(match.group(1).strip() + "\n", encoding="utf-8")
        render_block(mmdc, mmd, png, cfg, scale)
        # caminho absoluto file:// — wkhtmltopdf resolve imagens a partir do
        # CWD do pandoc, não do --resource-path
        return f"![Diagrama {stem}-{idx:02d}]({png.resolve().as_uri()})"

    processed = MERMAID_BLOCK_RE.sub(_replace, text)
    processed = REMOTE_IMAGE_RE.sub("", processed)

    out_md = outdir / "processed.md"
    out_md.write_text(processed, encoding="utf-8")
    log.info("processed markdown written - file=%s diagrams=%d", out_md, idx)
    return out_md


def main() -> int:
    parser = argparse.ArgumentParser(description="Render mermaid blocks and preprocess markdown for PDF.")
    parser.add_argument("input", type=Path, help="Arquivo .md de origem")
    parser.add_argument("--outdir", type=Path, required=True, help="Diretório de saída")
    parser.add_argument("--mmdc", default="mmdc", help="Executável do mermaid-cli")
    parser.add_argument("--puppeteer-config", type=Path, default=None, help="JSON de config do Puppeteer")
    parser.add_argument("--scale", type=int, default=3, help="Escala do PNG (padrão 3)")
    args = parser.parse_args()

    if not args.input.is_file():
        log.error("input not found - path=%s", args.input)
        return 1
    if args.puppeteer_config and not args.puppeteer_config.is_file():
        log.error("puppeteer config not found - path=%s", args.puppeteer_config)
        return 1

    try:
        process(args.input, args.outdir, args.mmdc, args.puppeteer_config, args.scale)
    except SystemExit:
        raise
    except Exception as exc:  # noqa: BLE001 - boundary do script
        log.error("unexpected failure - file=%s error=%s", args.input, exc)
        return 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
