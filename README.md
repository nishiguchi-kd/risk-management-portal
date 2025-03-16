# リスク管理ポータル - ローカルセットアップ

このリポジトリには、リスク管理ポータルをローカルで実行するためのDocker設定ファイルが含まれています。このアプリケーションはSymfonyフレームワークで構築され、レンダリングにTwigテンプレートを使用しています。

## 前提条件

- Docker
- Docker Compose

## セットアップ手順

1. このリポジトリをクローンします：
   ```bash
   git clone https://github.com/nishiguchi-kd/risk-management-portal.git
   cd risk-management-portal
   ```

2. セットアップスクリプトを実行します：
   ```bash
   chmod +x setup.sh
   ./setup.sh
   ```

3. Dockerコンテナをビルドして起動します：
   ```bash
   docker-compose up -d
   ```

4. アプリケーションにアクセスします： http://localhost:8080

## ディレクトリ構造

セットアップスクリプトを実行すると、以下のようなディレクトリ構造が作成されます：

```
risk-management-portal/
├── docker-compose.yml
├── Dockerfile
├── setup.sh
├── app/
│   ├── public/
│   │   └── index.php
│   ├── template/
│   │   └── default/
│   └── assets/
│       ├── css/
│       ├── js/
│       └── images/
└── docker/
    └── nginx/
        └── default.conf
```

## Twigテンプレートを追加する

提供されたTwigテンプレートファイルをapp/templateディレクトリに配置します。例えば：

- `app/template/default/index.twig`
- `app/template/default/search.twig`
- `app/template/default/Search/Category/consulting.twig`
- 他のテンプレートファイル...

## 新しいSymfonyプロジェクトの作成（オプション）

既存のテンプレートを使用する代わりに新しいSymfonyプロジェクトを作成したい場合：

1. PHPコンテナに入ります：
   ```bash
   docker-compose exec php bash
   ```

2. Symfonyをインストールします：
   ```bash
   composer create-project symfony/website-skeleton .
   ```

3. .envファイルでデータベース接続を設定します：
   ```
   DATABASE_URL=mysql://app:app_password@database:3306/risk_management
   ```

4. Twigの設定を更新して、カスタムテンプレートディレクトリを使用できるようにします：
   ```yaml
   # config/packages/twig.yaml
   twig:
       default_path: '%kernel.project_dir%/template'
       paths:
           '%kernel.project_dir%/template': 'template'
           '%kernel.project_dir%/assets': 'assets'
   ```

## トラブルシューティング

- 権限の問題が発生した場合は、appディレクトリの権限を調整する必要があるかもしれません：
  ```bash
  chmod -R 777 app
  ```

- データベースに接続する必要がある場合は、以下を使用して接続できます：
  ```
  ホスト: localhost
  ポート: 3306
  ユーザー名: app
  パスワード: app_password
  データベース: risk_management
  ```