# init-claude

CAP (Cloud Application Programming Model) プロジェクトでAIコーディングアシスタントを使った開発を始めるための初期設定ツール。

## 目的

新しいCAPプロジェクトに、AIコーディングアシスタント（Claude Code、GitHub Copilot、Cursor等）向けの開発ガイドラインとMCP設定を簡単にセットアップできます。

## 機能

このツールは以下のファイルをプロジェクトにコピーします：

- **CLAUDE.md** - Claude Code用の設定ファイル（AGENTS.mdへの参照）
- **.mcp.json** - MCP (Model Context Protocol) サーバー設定
  - CAP MCP Server (@cap-js/mcp-server)
  - Fiori MCP Server (@sap-ux/fiori-mcp-server)
  - UI5 MCP Server (@ui5/mcp-server)
  - SAP Docs Remote

コピー後、`.gitignore`にこれらのファイルを自動追加します。

## 使い方

### 1. 新しいCAPプロジェクトで実行

```bash
cd /path/to/your/new/cap/project
/path/to/init-claude/init-claude.sh
```

### 2. 実行結果

以下のファイルがプロジェクトルートに作成されます：

```
your-project/
├── CLAUDE.md          # AIアシスタント向けガイドライン
├── .mcp.json          # MCP設定
└── .gitignore         # 上記ファイルが追加される
```

### 3. AGENTS.mdとドキュメントの参照

- **CLAUDE.md**は`templates/AGENTS.md`を参照します
- **AGENTS.md**は`templates/docs/guides/`配下の詳細ガイドを参照します
- これらのファイルはコピーされず、このリポジトリから参照される設計です

詳細なガイドラインは以下を参照：
- [AGENTS.md](templates/AGENTS.md) - 全AIアシスタント向けガイドライン
- [docs/guides/](templates/docs/guides/) - 詳細な開発ガイド集

## テンプレートの構成

```
templates/
├── CLAUDE.md                    # Claude Code用エントリーポイント
├── .mcp.json                    # MCP設定
├── AGENTS.md                    # 全AIアシスタント向けガイドライン
└── docs/
    └── guides/                  # 詳細ガイド
        ├── git-workflow.md      # Gitワークフロー
        ├── debugging-guide.md   # デバッグとログ出力
        ├── test-strategy.md     # TDD戦略
        └── java/
            └── development-guide.md  # CAP Java開発ガイド
```

## 注意事項

- 既存の`CLAUDE.md`や`.mcp.json`がある場合、実行は中止されます
- `.gitignore`が存在しない場合は新規作成されます
- コピーされたファイルは自動的に`.gitignore`に追加されます

## カスタマイズ

プロジェクトに応じて以下をカスタマイズしてください：

1. **AGENTS.md**の「Project Type」セクション
   - ランタイム（Java/Node.js）を選択
   - 使用する機能（Fiori Elements、Draft等）をチェック
2. **Quick Reference Commands**セクション
   - プロジェクトの実際のパスに更新

## ライセンス

MIT
