#!/usr/bin/env bash
# Builds docs/index.html (GitHub Pages) from src/content.html (also published as-is as a Claude Artifact).
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p docs
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  sed -n '1,/^<\/style>$/p' src/content.html
  printf '</head>\n<body>\n'
  sed '1,/^<\/style>$/d' src/content.html
  printf '</body>\n</html>\n'
} > docs/index.html
