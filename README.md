devcontainer-php
=====================

memo
---------------------

```sh
composer create-project --prefer-dist --no-interaction --working-dir=/tmp cakephp/app:~5.0 phpproject
rsync -a /tmp/phpproject/* ./ && rm -fr /tmp/phpproject
```
