ディレクトリ構造
=========================

```
├ bin/
├ config/
│   └ schema/
├ docs/
├ logs/
├ plugins/
├ resources/
├ src/
│   ├ Console/
│   ├ Controller/
│   │   └ Component/
│   ├ Model/
│   │   ├ Behavior/
│   │   ├ Entity/
│   │   └ Table/
│   └ View/
│       ├ Cell/
│       └ Helper/
├ templates/
│   ├ cell/
│   ├ element/
│   │   └ flash/
│   ├ email/
│   │   ├ html/
│   │   └ text/
│   ├ Error/
│   ├ layout/
│   │   └ email/
│   └ Pages/
├ tests/
│   ├ Fixture/
│   └ TestCase/
│       ├ Controller/
│       ├ Model/
│       └ View/
├ tmp/
│   ├ cache/
│   │   ├ models/
│   │   ├ persistent/
│   │   └ views/
│   ├ sessions/
│   └ tests/
├ vendor/
│   ├ bin/
│   ├ brick/
│   ├ cakephp/
│   ├ composer/
│   ├ dealerdirect/
│   ├ doctrine/
│   ├ jasny/
│   ├ josegonzalez/
│   ├ justinrainbow/
│   ├ laminas/
│   ├ league/
│   ├ m1/
│   ├ marc-mabe/
│   ├ mobiledetect/
│   ├ myclabs/
│   ├ nikic/
│   ├ phar-io/
│   ├ phpstan/
│   ├ phpunit/
│   ├ psr/
│   ├ react/
│   ├ robmorgan/
│   ├ sebastian/
│   ├ seld/
│   ├ slevomat/
│   ├ squizlabs/
│   ├ staabm/
│   ├ symfony/
│   ├ theseer/
│   └ twig/
└ webroot/
    ├ css/
    ├ font/
    ├ img/
    └ js/
```

ディレクトリの役割
-------------------------

### bin/

bin/ディレクトリは、実行可能なスクリプトやコマンドラインツールを格納するためのディレクトリです。

### config/

config/ディレクトリは、アプリケーションの設定ファイルを格納するためのディレクトリです。

#### config/schema/

config/schema/ディレクトリは、データベースのスキーマ定義ファイルを格納するためのディレクトリです。

### docs/

docs/ディレクトリは、プロジェクトのドキュメントを格納するためのディレクトリです。

### logs/

logs/ディレクトリは、アプリケーションのログファイルを格納するためのディレクトリです。

### plugins/

plugins/ディレクトリは、CakePHPプラグインを格納するためのディレクトリです。

### resources/

resources/ディレクトリは、リソースファイルを格納するためのディレクトリです。

### src/

src/ディレクトリは、アプリケーションのソースコードを格納するためのディレクトリです。
CakePHPアプリケーションのMVCパターンに基づいたコードがここに配置されます。

#### src/Console/

src/Console/ディレクトリは、コマンドラインインターフェース（CLI）用のコードを格納するためのディレクトリです。

#### src/Controller/

src/Controller/ディレクトリは、アプリケーションのコントローラークラスを格納するためのディレクトリです。

##### src/Controller/Component/

src/Controller/Component/ディレクトリは、コントローラーで使用するコンポーネントクラスを格納するためのディレクトリです。

#### src/Model/

src/Model/ディレクトリは、アプリケーションのモデルクラスを格納するためのディレクトリです。

##### src/Model/Behavior/

src/Model/Behavior/ディレクトリは、モデルで使用するビヘイビアクラスを格納するためのディレクトリです。

##### src/Model/Entity/

src/Model/Entity/ディレクトリは、エンティティクラスを格納するためのディレクトリです。

##### src/Model/Table/

src/Model/Table/ディレクトリは、テーブルクラスを格納するためのディレクトリです。

#### src/View/

src/View/ディレクトリは、アプリケーションのビュークラスを格納するためのディレクトリです。

##### src/View/Cell/

src/View/Cell/ディレクトリは、ビューセルクラスを格納するためのディレクトリです。

##### src/View/Helper/

src/View/Helper/ディレクトリは、ビューヘルパークラスを格納するためのディレクトリです。

### templates/

templates/ディレクトリは、アプリケーションのテンプレートファイルを格納するためのディレクトリです。

#### templates/cell/

templates/cell/ディレクトリは、ビューセルのテンプレートファイルを格納するためのディレクトリです。

#### templates/element/

templates/element/ディレクトリは、再利用可能なテンプレート要素を格納するためのディレクトリです。

##### templates/element/flash/

templates/element/flash/ディレクトリは、フラッシュメッセージのテンプレートを格納するためのディレクトリです。

#### templates/email/

templates/email/ディレクトリは、メール送信用のテンプレートを格納するためのディレクトリです。

##### templates/email/html/

templates/email/html/ディレクトリは、HTML形式のメールテンプレートを格納するためのディレクトリです。

##### templates/email/text/

templates/email/text/ディレクトリは、テキスト形式のメールテンプレートを格納するためのディレクトリです。

#### templates/Error/

templates/Error/ディレクトリは、エラーページのテンプレートを格納するためのディレクトリです。

#### templates/layout/

templates/layout/ディレクトリは、レイアウトテンプレートを格納するためのディレクトリです。

##### templates/layout/email/

templates/layout/email/ディレクトリは、メール用のレイアウトテンプレートを格納するためのディレクトリです。

#### templates/Pages/

templates/Pages/ディレクトリは、静的ページのテンプレートを格納するためのディレクトリです。

### tests/

tests/ディレクトリは、アプリケーションのテストコードを格納するためのディレクトリです。

#### tests/Fixture/

tests/Fixture/ディレクトリは、テスト用のフィクスチャを格納するためのディレクトリです。

#### tests/TestCase/

tests/TestCase/ディレクトリは、テストケースクラスを格納するためのディレクトリです。

##### tests/TestCase/Controller/

tests/TestCase/Controller/ディレクトリは、コントローラーのテストケースを格納するためのディレクトリです。

##### tests/TestCase/Model/

tests/TestCase/Model/ディレクトリは、モデルのテストケースを格納するためのディレクトリです。

##### tests/TestCase/View/

tests/TestCase/View/ディレクトリは、ビューのテストケースを格納するためのディレクトリです。

### tmp/

tmp/ディレクトリは、一時ファイルを格納するためのディレクトリです。
キャッシュやセッション情報、テスト実行時の一時ファイルなどが保存されます。

#### tmp/cache/

tmp/cache/ディレクトリは、キャッシュファイルを格納するためのディレクトリです。

##### tmp/cache/models/

tmp/cache/models/ディレクトリは、モデルのキャッシュを格納するためのディレクトリです。

##### tmp/cache/persistent/

tmp/cache/persistent/ディレクトリは、永続的なキャッシュデータを格納するためのディレクトリです。

##### tmp/cache/views/

tmp/cache/views/ディレクトリは、ビューのキャッシュを格納するためのディレクトリです。

#### tmp/sessions/

tmp/sessions/ディレクトリは、セッションデータを格納するためのディレクトリです。

#### tmp/tests/

tmp/tests/ディレクトリは、テスト実行時の一時ファイルを格納するためのディレクトリです。

### vendor/

vendor/ディレクトリは、Composerによってインストールされた外部ライブラリを格納するためのディレクトリです。

#### vendor/bin/

vendor/bin/ディレクトリは、Composerでインストールされたパッケージによって提供される実行可能ファイルを格納するためのディレクトリです。

#### vendor/cakephp/

vendor/cakephp/ディレクトリは、CakePHPのコアライブラリを格納するためのディレクトリです。

### webroot/

webroot/ディレクトリは、Webサーバーのドキュメントルートとなるディレクトリです。
CSS、JavaScript、画像などの静的なファイルが配置されます。

#### webroot/css/

webroot/css/ディレクトリは、CSSファイルを格納するためのディレクトリです。

#### webroot/font/

webroot/font/ディレクトリは、フォントファイルを格納するためのディレクトリです。

#### webroot/img/

webroot/img/ディレクトリは、画像ファイルを格納するためのディレクトリです。

#### webroot/js/

webroot/js/ディレクトリは、JavaScriptファイルを格納するためのディレクトリです。
