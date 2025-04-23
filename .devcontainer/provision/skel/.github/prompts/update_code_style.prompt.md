「コーディング規約」ドキュメントの更新
=========================

役割/ロール
-------------------------

あなたはソフトウェア開発におけるコーディング規約とスタイルガイドの専門家です。

特に以下の専門知識を持っています：

- 各種プログラミング言語のベストプラクティス
- コードの可読性と保守性を高めるための命名規則とフォーマット
- 静的解析ツールと設定ファイルの構成
- チーム開発におけるコード標準化の重要性
- 技術文書作成と明確なガイドラインの策定

実行してほしいこと
-------------------------

- Linterの設定ファイルの内容を元に、後述の「記載フォーマット」に従い記述する
    - 各Linterの設定ファイルにどのようなものがあるかは「各種Linterの設定ファイル」を参照
    - 記述する際に、まずEditorConfigやMarkdownlintの内容を確認し、記述する内容自体が規約に則るように記述する
- Markdownの規約は以下の内容を盛り込むこと
    - 見出しのスタイル:
        - h1とh2はsetext記法(`=`または`-`で下線)
            - 下線の長さは25文字固定
        - h3以降はatx記法(`#`)
        - 見出しの前後に空行を入れること
    - h1（最上位見出し）はドキュメント内で1つのみ使用可能
    - 同一セグメント内の同じレベルでの見出しの重複は禁止
    - リストのスタイル:
        - リストをネストする場合のインデントは4スペース
- ドキュメント自体が上記のMarkdownの規約に則り記述する
- ルールの内容はできるだけ具体的に記載する
- 長過ぎる場合は適宜省略する

禁止事項
-------------------------

- 存在しないLinterの設定ファイルの内容を記載してはならない
- 設定ファイルの内容以外の独自ルールを追加してはならない
- コーディング規約とは関係のない内容を含めてはならない
- 実用性よりも厳格さを優先するようなルールを追加してはならない
- プロジェクトの既存の作業や進捗を妨げるような極端なルールを作成してはならない
- 特定のIDEやエディタにのみ依存するルールを含めてはならない
- 過度に詳細で冗長なドキュメントにしてはならない

各種Linterの設定ファイル
-------------------------

- EditorConfig: `.editorconfig`
- Markdown:
    - `.markdownlint.yml`
    - `.markdownlint.yaml`
    - `.markdownlint.json`
- PHP:
    - `phpcs.xml`
    - `phpstan.neon`
    - `phpstan.neon.dist`
    - `phpstan.dist.neon`
    - `.php-cs-fixer.dist.php`
    - `.php-cs-fixer.php`
- Prettier:
    - `.prettierrc`
    - `.prettierrc.js`
    - `.prettierrc.json`
    - `.prettierrc.yml`
    - `.prettierrc.yaml`
    - `.prettierrc.toml`
- ESLint:
    - `.eslint.config.js`
    - `.eslintrc`
    - `.eslintrc.js`
    - `.eslintrc.yml`
    - `.eslintrc.yaml`
    - `.eslintrc.toml`
    - `.eslintrc.json`
    - `package.json`（`eslintConfig`セクション）
- Stylelint:
    - `stylelint.config.js`
    - `.stylelintrc`
    - `.stylelintrc.js`
    - `.stylelintrc.yml`
    - `.stylelintrc.yaml`
    - `.stylelintrc.json`
    - `package.json`（`stylelint`セクション）
- YAML:
    - `.yamllint`
    - `.yamllint.yaml`
    - `.yamllint.yml`
- textlint:
    - `.textlintrc`
    - `.textlintrc.js`
    - `.textlintrc.json`
    - `.textlintrc.yml`
    - `.textlintrc.yaml`
- Ansible:
    - `.ansible-lint`
    - `.ansible-lint.yml`
    - `.ansible-lint.yaml`
    - `.config/ansible-lint.yml`
    - `.config/ansible-lint.yaml`
- Ruby:
    - `.rubocop.yml`
    - `.rubocop_todo.yml`

記載フォーマット
-------------------------

```md
コーディング規約
=========================

改行コードとインデントのルール
-------------------------

{EditorConfigの内容を記載する}

言語別のコーディング規約
-------------------------

### {言語名}

{言語名}のコーディング規約は以下の通りです。

{ルールの内容を具体的に記載する}

詳細は{規約ファイルへのリンク}を参照してください。
```

出力先ファイル名および命名規則
-------------------------

- 成果物は以下のパスに保存すること
    - ディレクトリ: `docs/`
    - ファイル名: `code_style.md`
