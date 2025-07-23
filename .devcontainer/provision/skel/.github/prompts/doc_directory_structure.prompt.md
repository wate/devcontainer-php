---
mode: agent
model: Claude Sonnet 4
---
「ディレクトリ構造」ドキュメントの更新
=========================

指示
-------------------------

ディレクトリ構造を調べて、以下のルールに従い内容を作成する。

### 出力する内容

- ディレクトリのみを出力しファイルは出力しない
- ただし「例外事項」で明示されているものはこのルールに従わない
    - 「存在する場合は含める」に記載のあるものうち、実際に存在するものはファイルであっても出力する
    - 「存在しなくても含める」に記載のあるものは、実際に存在しなくても出力する
    - 「含めない」に記載のあるものは出力しない

### 出力内容のルール

- 出力する階層は以下のルールに従うこと
    - 基本的には2階層目までを出力する
    - ただし、以下の条件を満たす場合は3階層目まで出力する
        - パスが`src/`で始まる
        - パスが`templates/`で始まる
- ディレクトリの末尾には`/`を付ける
- ディレクトリには役割や説明を以下のルールで付記すること
    - 日本語で記載
    - ディレクトリ名の後に`#`と半角スペース1つを挟んで記載
    - 階層に応じて4スペースのインデントを付け、各階層で揃える
- 階層を表す罫線の出力は以下のルールに従うこと:
    - `│`は出力する
    - `├`は出力する
    - `└`は出力する
    - `─`は出力しない

### 出力内容の順序について

- ディレクトリの昇順、次にファイルの昇順で出力する
- トップディレクトリの設定ファイルは最後に出力する
- 後述の「例外事項」の「出力順序について」に明示されているものは、この順序に従わない

禁止事項
-------------------------

- カレントディレクトリ表記`./`は出力しない

例外事項
-------------------------

### 存在する場合は含める

- `.devcontainer/`: ローカル開発環境構築用の設定ファイル格納ディレクトリ
- `vendor/`: 依存パッケージを管理するためのディレクトリ
- `webroot/index.php`: WebサーバーのルートURLにアクセスした際に実行されるファイル
- 各言語のパッケージマネージャーの設定ファイル
- 各種Linterの設定ファイル
    - 設定ファイルにどのようなものがあるかは、後述の「各種Linterの設定ファイル」を参照すること
- デプロイ処理用の設定ファイル
    - `ansible.cfg`: Ansibleの設定ファイル
    - `deploy.yml`: Ansibleのデプロイ処理用Playbook
    - `inventory.yml`: Ansibleのインベントリファイル
- その他の設定ファイル
    - `Taskfile.yml`: Taskの設定ファイル
    - `mkdocs.yml`: MkDocsの設定ファイル
    - `tsconfig.json`: TypeScriptの設定ファイル
    - `rollup.config.js`: Rollupの設定ファイル
    - `.tbls.yml`または`tbls.yml`: テーブル定義ドキュメント生成ツールの設定ファイル
    - `.pre-commit-config.yaml`: pre-commitの設定ファイル
    - `README.*`: プロジェクトの概要を記載したドキュメント

### 存在しなくても含める

なし

### 含めない

- `.devcontainer/*`: 開発環境構築用の設定ファイル格納ディレクトリの中身は含めない
- `vendor/*`: 依存パッケージの中身は含めない
- `tree.txt`: treeコマンドの出力結果を格納したファイル
- `provision_config.yml`: プロビジョニング設定ファイル

### 出力内容の順序について

- `README.*`: 最初に出力すること。

各種Linterの設定ファイル
-------------------------

### EditorConfig

- `.editorconfig`

### Markdownlint

- `.markdownlint.yml`
- `.markdownlint.yaml`
- `.markdownlint.json`

### PHP

- `phpcs.xml`
- `phpstan.neon`
- `phpstan.neon.dist`
- `phpstan.dist.neon`
- `.php-cs-fixer.dist.php`
- `.php-cs-fixer.php`

### Prettier

- `.prettierrc`
- `.prettierrc.*`

### ESLint

- `.eslint.config.js`
- `.eslintrc`
- `.eslintrc.*`
- `package.json`（`eslintConfig`セクション）

### Stylelint

- `stylelint.config.js`
- `.stylelintrc`
- `.stylelintrc.*`
- `package.json`（`stylelint`セクション）

### yamllint

- `.yamllint`
- `.yamllint.yml`
- `.yamllint.yaml`

### textlint

- `.textlintrc`
- `.textlintrc.*`

### Ansible-lint

- `.ansible-lint`
- `.ansible-lint.yml`
- `.ansible-lint.yaml`

### Ruby

- `.rubocop.yml`
- `.rubocop_todo.yml`

出力フォーマット
-------------------------

~~~md
ディレクトリ構造
=========================

```
├ README.md                 # READMEファイル
├ .devcontainer/            # 開発環境構築用の設定ファイル格納ディレクトリ
├ bin/                      # 各種コマンド格納ディレクトリ
├ docs/                     # システムドキュメント格納ディレクトリ
│   ├ assets/                  # ドキュメントサイト生成時の画像などのリソースの格納ディレクトリ
│   ├ features/                # 機能一覧と各機能の詳細説明の格納ディレクトリ
│   ├ rules/                   # ドキュメントの表記統一ルールの格納ディレクトリ
│   ├ schema/                  # テーブル定義書の格納ディレクトリ
│   └ SUMMARY.md               # ドキュメントサイトのナビゲーション定義を記述するファイル
├ config/                   # 設定ファイルを格納するディレクトリ
│   ├ Migrations/              # データベースマイグレーション格納ディレクトリ
│   ├ Seeds/                   # シードデータ格納ディレクトリ
│   └ schema/                  # スキーマ定義格納ディレクトリ
├ resources/                # リソースファイル格納ディレクトリ
│   └ locales/                 # 翻訳ファイル格納ディレクトリ
├ src/                      # ソースコード格納ディレクトリ
│   ├ Console/                 # コンソールコマンド格納ディレクトリ
│   ├ Controller/              # コントローラクラス格納ディレクトリ
│   │   └ Component/              # コントローラコンポーネント格納ディレクトリ
│   ├ Model/                   # モデル格納ディレクトリ
│   │   ├ Behavior/               # モデルビヘイビア格納ディレクトリ
│   │   ├ Entity/                 # エンティティクラス格納ディレクトリ
│   │   └ Table/                  # テーブルクラス格納ディレクトリ
│   └ View/                    # ビュー格納ディレクトリ
│       ├ Cell/                   # ビューセル格納ディレクトリ
│       └ Helper/                 # ビューヘルパー格納ディレクトリ
├ templates/                # テンプレートファイル格納ディレクトリ
│   ├ cell/                    # セルテンプレート格納ディレクトリ
│   ├ element/                 # テンプレートの要素格納ディレクトリ
│   │   └ flash/                  # フラッシュメッセージ要素格納ディレクトリ
│   ├ email/                   # メールテンプレート格納ディレクトリ
│   │   ├ html/                   # HTMLメールテンプレート格納ディレクトリ
│   │   └ text/                   # テキストメールテンプレート格納ディレクトリ
│   ├ Error/                   # エラーテンプレート格納ディレクトリ
│   ├ layout/                  # レイアウトテンプレート格納ディレクトリ
│   │   └ email/                  # メールレイアウト格納ディレクトリ
│   ├ Pages/                   # ページテンプレート格納ディレクトリ
│   └ plugin/                  # プラグインテンプレート格納ディレクトリ
├ tests/                    # テストコード格納ディレクトリ
│   ├ Fixture/                 # テスト用データ格納ディレクトリ
│   └ TestCase/                # テストケース格納ディレクトリ
├ tmp/                      # 一時ファイル格納ディレクトリ
├ logs/                     # システムログ格納ディレクトリ
├ vendor/                   # 外部ライブラリ格納ディレクトリ
├ webroot/                  # ドキュメントルートディレクトリ
│  ├ css/                      # CSSファイル格納ディレクトリ
│  ├ js/                       # JavaScriptファイル格納ディレクトリ
│  ├ img/                      # 画像ファイル格納ディレクトリ
│  └ index.php                 # WebサーバのルートURLにアクセスした際に実行されるファイル
├ .editorconfig            # EditorConfigの設定ファイル
├ ansible.cfg               # Ansibleの設定ファイル
├ deploy.yml                # デプロイ処理用Playbook
└ inventory.yml             # Ansibleのインベントリファイル
```
~~~

出力先ファイル名および命名規則
-------------------------

- 成果物は以下のパスに保存する
    - ディレクトリ: `docs/`
    - ファイル名: `directory_structure.md`
- ディレクトリが存在するか確認する
    - ディレクトリが存在しない場合は作成する
