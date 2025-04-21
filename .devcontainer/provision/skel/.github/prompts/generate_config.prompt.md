設定ファイルの生成
=========================

実行してほしいこと
-------------------------

- 以下の各ツールの設定ファイルを生成しなさい
    - pre-commit
    - EditorConfig
    - MarkdownLint
    - TypeScript
    - PHP Code Sniffer
    - PHPStan
    - Prettier
    - YAML Lint
    - Rollup
    - textlint
- 設定ファイルは以下の形式で生成すること
    - pre-commit: .pre-commit-config.yaml
    - EditorConfig: .editorconfig
    - MarkdownLint: .markdownlint.yml
    - TypeScript: tsconfig.json
    - PHP Code Sniffer: phpcs.xml
    - PHPStan: phpstan.neon
    - Prettier: .prettierrc.yml
    - YAML Lint: .yamllint.yaml
    - Rollup: rollup.config.js
    - textlint: .textlintrc.yml
- 設定ファイルは、各ツールのトップディレクトリに配置すること
- 各設定項目の説明を日本語でコメントとして記載すること

禁止事項
-------------------------

- すでに存在するファイルは上書きしない
    - 設定ファイルの検索対象はトップディレクトリのみとする
- 不要なコメントや空行を含めない
- 設定ファイルの内容が不明瞭な場合は、デフォルト値を使用する
- Prettierの設定ファイルにJavaScript/TypeScript以外の言語の設定は含めない
