devcontainer-php
=====================

PHPプロジェクの作成
---------------------

### CakePHP

```sh
composer create-project --prefer-dist --no-interaction --working-dir=/tmp cakephp/app:~5.0 phpproject
rsync -a /tmp/phpproject/* ./ && rsync -a /tmp/phpproject/.??* ./ && rm -fr /tmp/phpproject
## Webサーバー(Apache)のドキュメントルートのシンボリックリンクを変更
sudo rm -rf /var/www/html
sudo ln -s "${PWD}/webroot" /var/www/html
## Webサーバー(Apache)を再起動
apache2ctl restart
```
