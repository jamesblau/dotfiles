#!/usr/bin/env python3
"""Build a one-page "vim-letter" PDF from *_vim_letter.md.

Usage:
  python3 vim_letter_builder.py --css style.css path/to/Whatever_vim_letter.md

It will produce:
  path/to/Whatever.html
  path/to/Whatever.pdf

Notes:
- The displayed filename in the vim bars is derived from the input filename by
  removing the trailing "_vim_letter".
- The last block element in the markdown can be pushed to the bottom via CSS
  (handy for a small easter egg / command line).
"""

from __future__ import annotations

import argparse
import re
import subprocess
from pathlib import Path


def _strip_markdown_for_counts(md: str) -> str:
    # remove code fences and inline code to avoid overcounting weird tokens
    md = re.sub(r"```.*?```", " ", md, flags=re.S)
    md = re.sub(r"`[^`]*`", " ", md)
    # remove HTML tags
    md = re.sub(r"<[^>]+>", " ", md)
    return md


def _word_count(md: str) -> int:
    text = _strip_markdown_for_counts(md)
    words = re.findall(r"\b\w+(?:[-']\w+)*\b", text)
    return len(words)


def _line_count(md: str) -> int:
    # Rough proxy for Vim's "line" feel: count non-empty lines.
    lines = [ln for ln in md.splitlines() if ln.strip()]
    return max(1, len(lines))


def _display_filename(input_path: Path) -> str:
    name = input_path.name
    if name.endswith("_vim_letter.md"):
        return name.replace("_vim_letter.md", ".md")
    if name.endswith(".md"):
        return name
    return name + ".md"


def _run(cmd: list[str]) -> None:
    subprocess.run(cmd, check=True)


def _write_tmp(dirpath: Path, name: str, content: str) -> Path:
    p = dirpath / name
    p.write_text(content, encoding="utf-8")
    return p


def build(md_path: Path, css_path: Path) -> tuple[Path, Path]:
    md_text = md_path.read_text(encoding="utf-8")

    base_no_ext = md_path.with_suffix("")  # .../Whatever_vim_letter
    if base_no_ext.name.endswith("_vim_letter"):
        out_base = base_no_ext.with_name(base_no_ext.name.replace("_vim_letter", ""))
    else:
        out_base = base_no_ext

    out_html = out_base.with_suffix(".html")
    out_pdf = out_base.with_suffix(".pdf")

    shown = _display_filename(md_path)
    wc = _word_count(md_text)
    lc = _line_count(md_text)

    top_left = f"1: {shown}  2: {css_path.name} |"
    top_right = " buffers"

    bottom_left = f"NORMAL  {shown}"
    bottom_right = f" markdown  utf-8[unix]  {wc} words   1/{lc} "

    before_html = "\n".join(
        [
            '<div class="page">',
            '  <div class="vim-top">',
            '    <div class="vim-bar-inner">',
            f'      <div class="vim-top-left">{top_left}</div>',
            f'      <div class="vim-top-right">{top_right}</div>',
            "    </div>",
            "  </div>",
            '  <div class="vim-content">',
        ]
    )

    after_html = "\n".join(
        [
            "  </div>",
            '  <div class="vim-bottom">',
            '    <div class="vim-bar-inner">',
            f'      <div class="vim-bottom-left">{bottom_left}</div>',
            f'      <div class="vim-bottom-right">{bottom_right}</div>',
            "    </div>",
            "  </div>",
            "</div>",
        ]
    )

    # Pandoc -> HTML
    _run(
        [
            "pandoc",
            "--standalone",
            "-c",
            str(css_path),
            "--include-before-body",
            str(_write_tmp(md_path.parent, "_vim_before.html", before_html)),
            "--include-after-body",
            str(_write_tmp(md_path.parent, "_vim_after.html", after_html)),
            "-f",
            "markdown",
            "-t",
            "html",
            "-o",
            str(out_html),
            str(md_path),
        ]
    )

    # HTML -> PDF
    _run(["weasyprint", str(out_html), str(out_pdf)])

    return out_html, out_pdf


def main() -> None:
    ap = argparse.ArgumentParser()
    ap.add_argument("md", type=Path)
    ap.add_argument("--css", type=Path, default=Path("style.css"))
    args = ap.parse_args()

    md_path: Path = args.md
    css_path: Path = args.css

    if not md_path.exists():
        raise SystemExit(f"Markdown not found: {md_path}")

    # Allow --css style.css relative to the markdown file.
    if not css_path.is_absolute():
        candidate = md_path.parent / css_path
        if candidate.exists():
            css_path = candidate

    if not css_path.exists():
        raise SystemExit(
            f"CSS not found: {css_path}\n"
            f"(Tip: put style.css next to the markdown, or pass --css /path/to/style.css)"
        )

    out_html, out_pdf = build(md_path, css_path)
    print(f"Wrote: {out_html}")
    print(f"Wrote: {out_pdf}")


if __name__ == "__main__":
    main()
