#!/usr/bin/env bash
set -euo pipefail

# templates/ の中身を現在のディレクトリにコピーする
# 既存ファイルがある場合は何もせず終了する
# .gitignore にそれらをコメント付きで追記（存在しない場合は作成）

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TEMPLATE_DIR="${SCRIPT_DIR}/templates"

copy_template_if_absent() {
  local src="$1"
  local dest="$2"

  if [[ -f "$dest" ]]; then
    echo "⚠️  ${dest} already exists. Aborting initialization."
    exit 1
  fi

  if [[ ! -f "$src" ]]; then
    echo "❌ Template not found: $src"
    exit 1
  fi

  cp "$src" "$dest"
  echo "✅ Created $dest"
}

copy_directory_if_absent() {
  local src="$1"
  local dest="$2"

  if [[ -d "$dest" ]]; then
    echo "⚠️  ${dest} directory already exists. Aborting initialization."
    exit 1
  fi

  if [[ ! -d "$src" ]]; then
    echo "❌ Template directory not found: $src"
    exit 1
  fi

  cp -r "$src" "$dest"
  echo "✅ Created $dest directory"
}

add_to_gitignore() {
  local gitignore=".gitignore"
  local entries=("CLAUDE.md" "AGENTS.md" ".mcp.json" "tmp/")

  # ファイルが存在しない場合は新規作成
  if [[ ! -f "$gitignore" ]]; then
    touch "$gitignore"
    echo "🆕 Created .gitignore"
  fi

  # すでにコメントブロックが存在するか確認
  if ! grep -q "^# Claude Code" "$gitignore"; then
    echo "" >> "$gitignore"
    echo "# Claude Code" >> "$gitignore"
  fi

  # 各エントリを存在チェック後に追記
  for entry in "${entries[@]}"; do
    if ! grep -qxF "$entry" "$gitignore"; then
      echo "$entry" >> "$gitignore"
      echo "📄 Added $entry to .gitignore"
    else
      echo "ℹ️  $entry already listed in .gitignore"
    fi
  done
}

main() {
  echo "🚀 Initializing Claude Code configuration..."
  copy_template_if_absent "${TEMPLATE_DIR}/CLAUDE.md" "CLAUDE.md"
  copy_template_if_absent "${TEMPLATE_DIR}/AGENTS.md" "AGENTS.md"
  copy_template_if_absent "${TEMPLATE_DIR}/.mcp.json" ".mcp.json"
  copy_directory_if_absent "${TEMPLATE_DIR}/docs" "docs"
  add_to_gitignore
  echo "🎉 Initialization completed successfully in: $PWD"
}

main "$@"