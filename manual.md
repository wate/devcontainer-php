利用マニュアル
=====================

PHPを使ったWebアプリケーションの開発環境を構築するための手順を記載しています。
以下に示す手順に従って、各フレームワークのプロジェクトスケルトン利用し、開発環境を構築してください。

PHPプロジェクトの作成手順
--------------------------

### 0. 開発コンテナーの作成/起動します

VSCodeを起動し、コマンドパレットを開き「開発コンテナー:コンテナーで再度開く」を選択し、
開発コンテナーを起動してください。

### 1. 一時ディレクトリにPHPプロジェクトのスケルトンの作成します

以下のコマンドを実行し、一時ディレクトリにPHPプロジェクトのスケルトンを作成します。

#### CakePHPの場合

```sh
composer create-project --prefer-dist --no-interaction --working-dir=/tmp cakephp/app php_project
```

#### Laravelの場合

```sh
composer create-project --prefer-dist --no-interaction --working-dir=/tmp laravel/laravel php_project
```

### 2. スケルトンをワーキングティレクトリーにコピーします

以下のコマンドを実行し、プロジェクトスケルトンをワーキングディレクトリーにコピーします。

```sh
shopt -s dotglob
rsync -a /tmp/php_project/* ./
```

### 3. 一時ディレクトリを削除します

以下のコマンドを実行し、プロジェクトスケルトンの一時ディレクトリを削除します。

```sh
rm -fr /tmp/php_project
```

### 4. フレームワークの初期セットアップを行います

以下のコマンドを実行し、クレームワークの設定ファイルを生成します。

#### CakePHPの場合

##### 4-1. CakePHPの設定ファイルを生成します

以下のコマンドを実行し、CakePHPの設定ファイルを生成します。

```sh
cat <<'EOS' > config/.env
export DEBUG="True"
export APP_NAME="app"
export APP_DEFAULT_LOCALE="ja_JP"
export APP_DEFAULT_TIMEZONE="Asia/Tokyo"

## ---------------------
## Database
## ---------------------
export DATABASE_URL="mysql://app_dev:app_dev_password@db/app_dev?encoding=utf8mb4&timezone=UTC&cacheMetadata=true&quoteIdentifiers=false&persistent=false"
export DATABASE_TEST_URL="mysql://app_test:app_test_password@db/app_test?encoding=utf8mb4&timezone=UTC&cacheMetadata=true&quoteIdentifiers=false&persistent=false"

## ---------------------
## Email
## ---------------------
export EMAIL_TRANSPORT_DEFAULT_URL="smtp://mailpit:1025"
## Example for Gmail
# export EMAIL_TRANSPORT_DEFAULT_URL="smtp://my@gmail.com:secret@smtp.gmail.com:587?tls=true"

## ---------------------
## Cache
## ---------------------
# export CACHE_DURATION="+2 minutes"
# export CACHE_DEFAULT_URL="file:///path/to/tmp/cache/?prefix=${APP_NAME}_default_&duration=${CACHE_DURATION}"
# export CACHE_CAKECORE_URL="file:///path/to/tmp/cache/persistent?prefix=${APP_NAME}_cake_translations_&serialize=true&duration=${CACHE_DURATION}"
# export CACHE_CAKEMODEL_URL="file:///path/to/tmp/cache/models?prefix=${APP_NAME}_cake_model_&serialize=true&duration=${CACHE_DURATION}"

## ---------------------
## Log
## ---------------------
# export LOG_DEBUG_URL="file:///path/to/logs/?levels[]=notice&levels[]=info&levels[]=debug&file=debug"
# export LOG_ERROR_URL="file:///path/to/logs/?levels[]=warning&levels[]=error&levels[]=critical&levels[]=alert&levels[]=emergency&file=error"
EOS
```

##### 4-2. dotenvパッケージを必須パッケージに変更します

以下のコマンドを実行し、必須パッケージとして`josegonzalez/dotenv`を指定します。

```sh
composer require josegonzalez/dotenv -q
```

##### 4-3. `bootstrap.php`で`.env`を読み込む処理を有効化します

以下のコマンドを実行し、`config/bootstrap.php`で`.env`を読み込む処理を有効化します。

```sh
cat <<'EOS' >bootstrap.php.patch
diff --git a/config/bootstrap.php b/config/bootstrap.php
index fa67096..1ef0f20 100644
--- a/config/bootstrap.php
+++ b/config/bootstrap.php
@@ -64,13 +64,13 @@ require CAKE . 'functions.php';
  * security risks. See https://github.com/josegonzalez/php-dotenv#general-security-information
  * for more information for recommended practices.
 */
-// if (!env('APP_NAME') && file_exists(CONFIG . '.env')) {
-//     $dotenv = new \josegonzalez\Dotenv\Loader([CONFIG . '.env']);
-//     $dotenv->parse()
-//         ->putenv()
-//         ->toEnv()
-//         ->toServer();
-// }
+if (!env('APP_NAME') && file_exists(CONFIG . '.env')) {
+    $dotenv = new \josegonzalez\Dotenv\Loader([CONFIG . '.env']);
+    $dotenv->parse()
+        ->putenv()
+        ->toEnv()
+        ->toServer();
+}

 /*
  * Initializes default Config store and loads the main configuration file (app.php)
EOS
patch -p1 <bootstrap.php.patch
rm bootstrap.php.patch
```

##### 4-4. cakeコマンドのコマンド補完が効くようにします

以下のコマンドを実行し、cakeコマンドのコマンド補完が効くようにします。

```sh
mkdir -p ~/.local/share/bash-completion/completions
cp bin/bash_completion.sh ~/.local/share/bash-completion/completions/cake
```

#### Laravelの場合

##### 4-1. Laravelの設定ファイルを更新します

以下のコマンドを実行し、Laravelの設定ファイルを更新します。

```sh
sed -i \
-e 's/APP_TIMEZONE=.*/APP_TIMEZONE=Asia\/Tokyo/' \
-e 's/APP_URL=.*/APP_URL=http:\/\/localhost:8080/' \
-e 's/APP_LOCALE=.*/APP_LOCALE=ja_JP/' \
-e 's/DB_CONNECTION=.*/DB_CONNECTION=mysql/' \
-e 's/# DB_HOST=.*/DB_HOST=db/' \
-e 's/# DB_PORT=.*/DB_PORT=3306/' \
-e 's/# DB_DATABASE=.*/DB_DATABASE=app_dev/' \
-e 's/# DB_USERNAME=.*/DB_USERNAME=app_dev/' \
-e 's/# DB_PASSWORD=.*/DB_PASSWORD=app_dev_password/' \
-e 's/MAIL_MAILER=.*/MAIL_MAILER=smtp/' \
-e 's/MAIL_SCHEME=.*/MAIL_SCHEME=null/' \
-e 's/MAIL_HOST=.*/MAIL_HOST=mailpit/' \
-e 's/MAIL_PORT=.*/MAIL_PORT=1025/' \
-e 's/MAIL_USERNAME=.*/MAIL_USERNAME=null/' \
-e 's/MAIL_PASSWORD=.*/MAIL_PASSWORD=null/' \
.env
```

##### 4-2. artisanコマンドのコマンド補完が効くようにします

以下のコマンドを実行し、artisanコマンドのコマンド補完が効くようにします。

```sh
cat <<'EOS' >> ~/.bashrc
# BEGIN artisan ANSIBLE MANAGED BLOCK
eval "$(/workspace/artisan completion)"
# END artisan ANSIBLE MANAGED BLOCK
EOS
```

### 5. Webサーバー(Apache)ドキュメントルートの設定を変更します

以下のコマンドを実行し、Webサーバー(Apache)のドキュメントルートを変更します。

#### CakePHPの場合

```sh
sudo rm -rf /var/www/html
sudo ln -s "${PWD}/webroot" /var/www/html
```

#### Laravelの場合

```sh
sudo rm -rf /var/www/html
sudo ln -s "${PWD}/public" /var/www/html
```

### 6. `.gitignore`に無視するファイルの設定を追記します

以下のコマンドを実行し、direnvの設定ファイルなどを誤ってコミットしないように、
`.gitignore`に設定を追記します。

```sh
cat <<EOS >> .gitignore
### Cache file directory ###
.cache
*.cache

### Ansible ###
.ansible
.devcontainer/provision/roles/

### direnv ###
.direnv
.envrc

### dotenv ###
.env

EOS
```

### 7. direnvの設定ファイルを生成し、設定を有効化します

以下のコマンドを実行し、direnvの設定ファイルを生成し、設定を有効化します。

```sh
cat <<EOS > .envrc
PATH_add bin
PATH_add .
layout php
layout node
source_env_if_exists .env
EOS
direnv allow
```

### 8. ローカル開発環境のURLを確認します

以下のURLをブラウザで開き、ローカル開発環境が正常に起動していることを確認してください。

* PHPコンテナー：http://localhost:8080/
* Mailpitコンテナー：http://localhost:8025/
    * Mailpitはメール送信のテストに利用する

CakePHPの各種プラグインのインストール手順
--------------------------

### [CakeLte(AdminLTE)プラグイン](https://github.com/arodu/cakelte)

#### 1. AdminLTEプラグインのインストール

以下のコマンドを実行し、CakeLte(AdminLTE)プラグインをインストールを行います。

```sh
## CakeLteプラグインのインストール
composer require arodu/cakelte
## CakeLteプラグインのロード
bin/cake plugin load CakeLte
### プラグインのテンプレートファイルをコピー
bin/cake cakelte copy_files --all
### プラグインのアセットファイルのシンボリックリンクを作成
bin/cake cakelte install
### 作成したシンボリックリンクを無視するように.gitignoreに追加
echo "### CakeLte ###" >>.gitignore
echo "webroot/adminlte" >>.gitignore
```

#### 2. AdminLTEプラグインの動作確認

以下のURLにアクセスして、AdminLTEのテストページが表示されることを確認してください。

http://localhost:8080/cake_lte/debug

#### 3. デフォルトのテンプレートをAdminLTEプラグインに変更

```sh
cp vendor/arodu/cakelte/config/cakelte.php config/cakelte.php
```

#### 4. デフォルトのテンプレートをAdminLTEプラグインに変更

以下のコマンドを実行し、デフォルトのテンプレートをAdminLTEプラグインに変更します。

```sh
cat <<'EOS' >AppView.php.patch
diff --git a/src/View/AppView.php b/src/View/AppView.php
index 1bfd5dc..1c04886 100644
--- a/src/View/AppView.php
+++ b/src/View/AppView.php
@@ -16,6 +16,7 @@ declare(strict_types=1);
 namespace App\View;

 use Cake\View\View;
+use CakeLte\View\CakeLteTrait;

 /**
  * Application View
@@ -26,6 +27,9 @@ use Cake\View\View;
  */
 class AppView extends View
 {
+    use CakeLteTrait;
+    protected string $layout = 'CakeLte.default';
+
     /**
      * Initialization hook method.
      *
@@ -37,5 +41,7 @@ class AppView extends View
      */
     public function initialize(): void
     {
+        parent::initialize();
+        $this->initializeCakeLte();
     }
 }
EOS
patch -p1 <AppView.php.patch
rm AppView.php.patch
```

※手動で行う場合は以下のURLの「How to use」に記載されている手順に従って、  
`src/View/AppView.php`の修正する。

https://github.com/arodu/cakelte?tab=readme-ov-file#how-to-use

### [Localizedプラグイン](https://github.com/cakephp/localized)

以下のコマンドを実行し、Localizedプラグインをインストールを行います。

```sh
## Localizedプラグインのインストール
composer require cakephp/localized
## Localizedプラグインのロード
bin/cake plugin load Cake/Localized
## ローカライズ用のリソースファイルをコピー
export CAKE_LOCALIZED_LOCALE=ja_JP
mkdir -p resources/locales/${CAKE_LOCALIZED_LOCALE}
cp vendor/cakephp/localized/resources/locales/${CAKE_LOCALIZED_LOCALE}/* resources/locales/${CAKE_LOCALIZED_LOCALE}/
```

### [IdeHelperプラグイン](https://github.com/dereuromark/cakephp-ide-helper)

以下のコマンドを実行し、IdeHelperプラグインをインストールを行います。

```sh
## IdeHelperプラグインのインストール
composer require --dev dereuromark/cakephp-ide-helper
## IdeHelperプラグインのロード
bin/cake plugin load IdeHelper --only-debug --only-cli
## コード補完ファイルの生成
bin/cake generate code_completion
```

その他のIdeHelperプラグインの利用方法については、以下のURLを参照してください。
https://github.com/dereuromark/cakephp-ide-helper/tree/master/docs

Laravelの各種インテグレーションのインストール手順
--------------------------

### [AdminLTEインテグレーション](https://jeroennoten.github.io/Laravel-AdminLTE/)

#### 1. AdminLTEインテグレーションをインストールする

以下のコマンドを実行し、AdminLTEプラグインをインストールを行います。

```sh
composer require jeroennoten/laravel-adminlte
```

#### 2. パッケージリソースをインストールする

```sh
artisan adminlte:install
```
