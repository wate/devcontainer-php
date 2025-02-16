利用マニュアル
=====================

PHPを使ったWebアプリケーションの開発環境を構築するための手順を記載しています。
以下に示す手順に従って、各フレームワークのプロジェクトスケルトン利用し、開発環境を構築してください。

PHPプロジェクトの作成手順
--------------------------

### 0. 開発コンテナーの作成/起動します

VSCodeを起動し、コマンドパレットを開き「開発コンテナー:コンテナーで再度開く」を選択し、
開発コンテナを起動してください。

### 1. 一時ディレクトリにPHPプロジェクトのスケルトンの作成します

以下のコマンドを実行し、一時ディレクトリにCakePHPのプロジェクトスケルトンを作成します。

### CakePHPの場合

```sh
composer create-project --prefer-dist --no-interaction --working-dir=/tmp cakephp/app php_project
```

### Laravelの場合

```sh
composer create-project --prefer-dist --no-interaction --working-dir=/tmp laravel/laravel php_project
```

### 2. スケルトンをワーキングティレクトリーにコピーします

以下のコマンドを実行し、プロジェクトスケルトンをワーキングディレクトリーにコピーします。

```sh
rsync -a /tmp/php_project/* ./
rsync -a /tmp/php_project/.??* ./
```

### 3. 一時ディレクトリを削除します

以下のコマンドを実行し、プロジェクトスケルトンの一時ディレクトリを削除します。

```sh
rm -fr /tmp/php_project
```

### 4. Webサーバー(Apache)ドキュメントルートの設定を変更します

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

### 4. Webサーバー(Apache)を再起動します

以下のコマンドを実行し、Webサーバー(Apache)を再起動します。

```sh
apache2ctl restart
```

### 5. `.gitignore`に無視するファイルの設定を追記します

以下のコマンドを実行し、direnvの設定ファイルなどを誤ってコミットしないように、
`.gitignore`に設定を追記します。

```sh
cat <<EOS >> .gitignore
### direnv ###
.direnv
.envrc

### dotenv ###
.env
EOS
```

### 6. direnvの設定ファイルを生成し、設定を有効化します

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

### 7. フレームワークの初期セットアップを行います

以下のコマンドを実行し、クレームワークの設定ファイルを生成します。

#### CakePHPの場合

##### 7-1. CakePHPの設定ファイルを生成します

以下のコマンドを実行し、CakePHPの設定ファイルを生成します。

```sh
cat <<EOS > config/.env
export DEBUG="True"
export APP_DEFAULT_LOCALE="ja_JP"
export APP_DEFAULT_TIMEZONE="Asia/Tokyo"
export DATABASE_URL="mysql://app_dev:app_dev_password@db/app_dev"
export DATABASE_TEST_URL="mysql://app_test:app_test_password@db/app_test"
export EMAIL_TRANSPORT_DEFAULT_URL="smtp://mailpit:1025"
EOS
```

##### 7-2. cakeコマンドのコマンド補完が効くようにします

以下のコマンドを実行し、cakeコマンドのコマンド補完が効くようにします。

```sh
mkdir -p ~/.local/share/bash-completion/completions
cp bin/bash_completion.sh ~/.local/share/bash-completion/completions/cake
```

#### Laravelの場合

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

##### 7-2. artisanコマンドのコマンド補完が効くようにします

以下のコマンドを実行し、artisanコマンドのコマンド補完が効くようにします。

```sh
cat <<'EOS' >> ~/.bashrc
# BEGIN artisan ANSIBLE MANAGED BLOCK
eval "$(/workspace/artisan completion)"
# END artisan ANSIBLE MANAGED BLOCK
EOS
```

### 8. ローカル開発環境のURLを確認します

以下のURLをブラウザで開き、ローカル開発環境が正常に起動していることを確認してください。

* PHPコンテナ：http://localhost:8080/
* Mailpitコンテナ：http://localhost:8025/
    * Mailpitはメール送信のテストに利用します。

CakePHPの各種プラグインのインストール手順
--------------------------

### AdminLTEプラグイン

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
```

#### 2. AdminLTEプラグインの動作確認

以下のURLにアクセスして、AdminLTEのテストページが表示されることを確認してください。

http://localhost:8080/cake_lte/debug

#### 3. デフォルトのテンプレートをAdminLTEプラグインに変更

以下のURLの「How to use」に記載されている手順に従って、`src/View/AppView.php`の書き換えを行い、
AdminLTEプラグインを利用して開発を行ってください。

https://github.com/arodu/cakelte?tab=readme-ov-file#how-to-use

### IdeHelperプラグイン

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

### AdminLTEインテグレーション

#### 1. AdminLTEインテグレーションをインストールする

以下のコマンドを実行し、AdminLTEプラグインをインストールを行います。

```sh
composer require jeroennoten/laravel-adminlte
```

#### 2. パッケージリソースをインストールする

```sh
artisan adminlte:install
```
