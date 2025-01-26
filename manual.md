devcontainer-php
=====================

PHPプロジェクの作成
---------------------

### CakePHP

```sh
## CakePHPのスケルトンを作成
composer create-project --prefer-dist --no-interaction --working-dir=/tmp cakephp/app:~5.0 phpproject
## スケルトンをワーキングティレクトリーにコピー
rsync -a /tmp/phpproject/* ./
rsync -a /tmp/phpproject/.??* ./
## 一時ディレクトリを削除
rm -fr /tmp/phpproject
## ドキュメントルートのシンボリックリンクを変更
sudo rm -rf /var/www/html
sudo ln -s "${PWD}/webroot" /var/www/html
## Webサーバー(Apache)を再起動
apache2ctl restart
## cakeコマンドのコマンド補完ファイルを設置
mkdir -p ~/.local/share/bash-completion/completions
cp bin/bash_completion.sh ~/.local/share/bash-completion/completions/cake
## CakePHPの設定ファイルを生成
cat <<EOS > config/.env
export DEBUG="True"
export APP_DEFAULT_LOCALE="ja_JP"
export APP_DEFAULT_TIMEZONE="Asia/Tokyo"
export DATABASE_URL="mysql://app_dev:app_dev_password@db/app_dev"
export DATABASE_TEST_URL="mysql://app_test:app_test_password@db/app_test"
export EMAIL_TRANSPORT_DEFAULT_URL="smtp://mailpit:1025"
EOS
## .gitignoreの設定を追記
cat <<EOS >> .gitignore
### direnv ###
.direnv
.envrc

### dotenv ###
.env
EOS
## direnvの設定ファイルを生成し、を設定を有効化
cat <<EOS > .envrc
PATH_add bin
layout php
layout node
source_env_if_exists .env
EOS
direnv allow
```

#### IdeHelperプラグインのインストール

```sh
composer require --dev dereuromark/cakephp-ide-helper
bin/cake plugin load IdeHelper --only-debug --only-cli
```

https://github.com/dereuromark/cakephp-ide-helper/tree/master/docs
