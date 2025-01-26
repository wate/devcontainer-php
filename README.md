devcontainer-php
=====================

PHPプロジェクの作成
---------------------

### CakePHP

```sh
composer create-project --prefer-dist --no-interaction --working-dir=/tmp cakephp/app:~5.0 phpproject
rsync -av /tmp/phpproject/.??* ./ && rm -fr /tmp/phpproject
```
