#!/usr/bin/env bash

set -exo pipefail

### 一時ディレクトリにPHPプロジェクトのスケルトンの作成します
composer create-project --prefer-dist --no-interaction --working-dir=/tmp cakephp/app php_project

### スケルトンをワーキングティレクトリーにコピーします

shopt -s dotglob
rsync -a /tmp/php_project/* ./

### 一時ディレクトリを削除します
rm -fr /tmp/php_project

### CakePHPの初期セットアップを行います

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

#### dotenvパッケージを必須パッケージに変更します

composer require josegonzalez/dotenv -q

### PHPStanを開発パッケージに追加します

composer require phpstan/phpstan --dev -q

### `bootstrap.php`で`.env`を読み込む処理を有効化します

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

### cakeコマンドのコマンド補完が効くようにします

mkdir -p ~/.local/share/bash-completion/completions
cp bin/bash_completion.sh ~/.local/share/bash-completion/completions/cake

### Webサーバー(Apache)ドキュメントルートの設定を変更します

sudo rm -rf /var/www/html
sudo ln -s "${PWD}/webroot" /var/www/html

### `.gitignore`に無視するファイルの設定を追記します

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

### direnvの設定ファイルを生成し、設定を有効化します

cat <<EOS > .envrc
PATH_add bin
PATH_add .
layout php
layout node
source_env_if_exists .env
EOS
direnv allow
