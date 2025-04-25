デプロイ手順書
=========================

本手順書は、本プロジェクトのアプリケーションをサーバーにデプロイするための手順を記載しています。
デプロイには、Ansibleを使用しています。

デプロイの前提条件
-------------------------

デプロイを実行するために、以下の環境が必要です。

### デプロイ実行環境

実行環境には以下のソフトウェアがインストールされていることを確認してください。

* Ansible
* SSH接続情報（各環境のサーバーに接続するための認証情報）

### デプロイ先サーバー

デプロイ先サーバーで以下のソフトウェアがインストールされていることを確認してください。

* Git（リモートリポジトリからのクローンに使用）
* PHP（バージョンはプロジェクトに依存）
* Composer（PHPの依存パッケージ管理に使用）

デプロイ方法
-------------------------

各環境ごとのデプロイ方法は以下のとおりです。

### 開発環境（Develop）

以下のコマンドを実行して開発環境へのデプロイを行います。

```sh
ansible-playbook -i inventory.yml deploy.yml --limit develop
```

### ステージング環境（Staging）

以下のコマンドを実行してステージング環境へのデプロイを行います。

```sh
ansible-playbook -i inventory.yml deploy.yml --limit staging
```

### 本番環境（Production）

以下のコマンドを実行して本番環境へのデプロイを行います。

```sh
ansible-playbook -i inventory.yml deploy.yml --limit production
```

変数設定
-------------------------

Playbookで利用されている主な変数は以下のとおりです。

### inventory.ymlで定義されている変数

* `app_repo`: アプリケーションのGitリポジトリURL
* `app_deploy_path`: デプロイ先のパス
* `rsync_exclude_opts`: rsync使用時の除外設定（.gitや.envなどのファイル）
* `app_repo_branch`: デプロイするブランチ名（環境ごとに異なる）
* `app_env`: アプリケーション実行環境（development、staging、production）

### deploy.ymlで利用される変数

* `security_salt`: CakePHPのセキュリティソルト（必要に応じて定義）
* `database_url`: データベース接続URL
* `debug`: デバッグモードの有効/無効設定（デフォルトはfalse）
* `create_asset_symlinks`: アセットのシンボリックリンクを作成するかどうか（デフォルトはfalse）
* `rebuild_orm_cache`: ORMキャッシュを再構築するかどうか（デフォルトはfalse）

### 接続設定に関する変数（環境ごとに設定可能）

inventory.ymlの各環境のhostsセクション内でホスト固有の接続設定を行うことができます。

* `ansible_host`: ホスト名またはIPアドレス
* `ansible_port`: SSHポート番号
* `ansible_user`: SSH接続ユーザー
* `ansible_password`: SSH接続パスワード
* `ansible_ssh_private_key_file`: SSH秘密鍵のパス

デプロイ手順の詳細
-------------------------

以下の内容はPlaybookの内容を手動で対応する場合の手順の記載しています、  
何らかの理由でAnsibleを使用できない場合の参考にしてください。

### 1. ソースコードのチェックアウト

Gitリポジトリからアプリケーションのソースコードをチェックアウトします。

```sh
git clone {app_repo} {app_deploy_path}
cd {app_deploy_path}
git checkout {app_repo_branch}
```

### 2. 新規セットアップ処理（初回デプロイ時）

#### 2.1 Composerの依存パッケージをインストール

```sh
composer install --no-dev --optimize-autoloader --no-interaction
```

#### 2.2 設定ファイルの準備

```sh
cp config/app_local.example.php config/app_local.php
```

#### 2.3 一時ディレクトリの作成

```sh
mkdir -p tmp/cache/models
mkdir -p tmp/cache/persistent
mkdir -p tmp/cache/views
mkdir -p tmp/sessions
mkdir -p tmp/tests
mkdir -p logs
chmod -R 0775 tmp logs
```

#### 2.4 セキュリティソルトの設定

設定ファイル（config/app_local.PHP）内のセキュリティソルト設定を更新します。

```sh
# 以下のコマンドはLinuxまたはmacOSの場合の例です
sed -i 's/'\''SecuritySalt'\''.*$/'\''SecuritySalt'\'' => env('\''SECURITY_SALT'\'', '\''YOUR_SECURITY_SALT'\''),/' config/app_local.php
```

#### 2.5 データベースマイグレーションの実行

```sh
export DATABASE_URL="{database_url}"
export DEBUG="{debug}"
export SECURITY_SALT="{security_salt}"
bin/cake migrations migrate
```

### 3. 更新時の処理

#### 3.1 Composerの依存パッケージを更新

```sh
composer install --no-dev --optimize-autoloader --no-interaction
```

#### 3.2 一時ディレクトリの権限を設定

```sh
chmod -R 0775 tmp logs
```

#### 3.3 キャッシュをクリア

```sh
export DEBUG="{debug}"
bin/cake cache clear_all
```

#### 3.4 アセットのシンボリックリンクを作成（必要な場合）

```sh
bin/cake plugin assets symlink
```

#### 3.5 データベースマイグレーションの実行

```sh
bin/cake migrations migrate
```

#### 3.6 ORMキャッシュの再構築（必要な場合）

```sh
bin/cake orm_cache clear
bin/cake orm_cache build
```

セキュリティに関する注意点
-------------------------

### セキュリティソルトの管理

* セキュリティソルトは必ず環境ごとに異なる値を設定してください。
* セキュリティソルトは十分な長さと複雑さを持つランダムな文字列を使用してください。
* セキュリティソルトはソースコード管理システムにはコミットせず、安全に管理してください。

### SSH接続情報の管理

* SSH秘密鍵は適切なパーミッション（600）で保護し、安全に管理してください。
* パスワード認証よりも、SSH鍵認証を優先して使用してください。
* 本番環境への接続情報は特に厳重に管理してください。

トラブルシューティング
-------------------------

### デプロイに失敗した場合

1. Ansibleのログを確認して、どのタスクで失敗しているか確認します。
2. 必要な権限があるか確認します（ファイルの書き込み権限など）。
3. 一時ディレクトリが書き込み可能かどうか確認します。
4. デプロイ先サーバーの空きディスク容量を確認します。

### データベースマイグレーションに失敗した場合

1. データベース接続設定が正しいか確認します。
2. マイグレーションファイルに構文エラーがないか確認します。
3. 手動でマイグレーションを実行して詳細なエラーメッセージを確認します。

```sh
bin/cake migrations migrate -v
```

### ロールバックが必要な場合

Ansibleプレイブックには明示的なロールバック機能は実装されていないため、  
以下の手順の則り手動でロールバックを行います。

1. 過去のバージョンにGitのチェックアウトを戻す

   ```sh
   cd {app_deploy_path}
   git checkout {previous_commit_or_tag}
   ```

2. 必要に応じて、データベースのロールバックを行う

   ```sh
   bin/cake migrations rollback
   ```

注意点と推奨事項
-------------------------

### デプロイ前の準備

* デプロイ前にローカル環境でテストを実行し、問題がないことを確認してください。
* コミットする前に、不要なデバッグコードやコメントアウトしたコードを削除してください。

### デプロイ後の確認

* デプロイ後は、アプリケーションの動作確認を必ず行ってください。
* ログファイルにエラーが出力されていないか確認してください。

### Slack通知機能

デプロイの成功または失敗時にSlackへ通知する機能が実装されています。この機能を使用するには、以下の環境変数を設定する必要があります。

* `SLACK_TOKEN`: Slackの認証トークン
* `SLACK_CHANNEL`: 通知を送信するSlackチャンネル（オプション）
* `SLACK_USERNAME`: 通知を送信する際のユーザー名（オプション）

成功時には緑色（#00ff00）、失敗時には赤色（#ff0000）で通知が送信されます。

### エラーハンドリング

プレイブックには `rescue` セクションが含まれており、デプロイ処理中にエラーが発生した場合も通知が行われるように設計されています。  
これにより、デプロイの失敗をすぐに検知し、対応できます。
