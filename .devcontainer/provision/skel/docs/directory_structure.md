ディレクトリ構造
=========================

```
├ README.md                 # READMEファイル
├ bin/                      # 各種コマンド格納ディレクトリ
├ config/                   # システム設定ファイル格納ディレクトリ
│   └ schema/                  # データベーススキーマ定義ディレクトリ
├ docs/                     # システムドキュメント格納ディレクトリ
│   ├ rules/                   # ドキュメントの表記統一ルールの格納ディレクトリ
│   └ schema/                  # テーブル定義書の格納ディレクトリ
├ logs/                     # システムログ格納ディレクトリ
├ plugins/                  # プラグイン格納ディレクトリ
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
│       ├ Controller/             # コントローラテスト格納ディレクトリ
│       ├ Model/                  # モデルテスト格納ディレクトリ
│       └ View/                   # ビューテスト格納ディレクトリ
├ tmp/                      # 一時ファイル格納ディレクトリ
│   ├ cache/                   # キャッシュファイル格納ディレクトリ
│   │   ├ models/                 # モデルキャッシュ格納ディレクトリ
│   │   ├ persistent/             # 永続的キャッシュ格納ディレクトリ
│   │   └ views/                  # ビューキャッシュ格納ディレクトリ
│   ├ sessions/                # セッションファイル格納ディレクトリ
│   └ tests/                   # テスト一時ファイル格納ディレクトリ
├ vendor/                   # 外部ライブラリ格納ディレクトリ
├ webroot/                  # ドキュメントルートディレクトリ
│   ├ css/                     # CSSファイル格納ディレクトリ
│   ├ font/                    # フォントファイル格納ディレクトリ
│   ├ img/                     # 画像ファイル格納ディレクトリ
│   ├ js/                      # JavaScriptファイル格納ディレクトリ
│   └ index.php                # WebサーバのルートURLにアクセスした際に実行されるファイル
├ .editorconfig             # EditorConfigの設定ファイル
├ .markdownlint.yml         # Markdownlintの設定ファイル
├ .pre-commit-config.yaml   # pre-commitの設定ファイル
├ .prettierrc.yml           # Prettierの設定ファイル
├ .textlintrc.yml           # textlintの設定ファイル
├ .yamllint.yml             # yamllintの設定ファイル
├ ansible.cfg               # Ansibleの設定ファイル
├ composer.json             # Composerの設定ファイル
├ composer.lock             # Composerのロックファイル
├ deploy.yml                # デプロイ処理用Playbook
├ inventory.yml             # Ansibleのインベントリファイル
├ mkdocs.yml                # MkDocsの設定ファイル
├ phpcs.xml                 # PHP_CodeSnifferの設定ファイル
├ phpstan.neon              # PHPStanの設定ファイル
├ phpunit.xml.dist          # PHPUnitの設定ファイル
├ psalm.xml                 # Psalmの設定ファイル
└ Taskfile.yml              # Taskの設定ファイル
```
