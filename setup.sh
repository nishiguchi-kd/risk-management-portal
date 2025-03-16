#!/bin/bash

# ディレクトリ構造を作成
echo "ディレクトリ構造を作成しています..."
mkdir -p app/public app/template/default app/assets/css app/assets/js app/assets/images docker/nginx

# サンプルファイルを実際のファイルにコピー
echo "設定ファイルを作成しています..."
cp docker/nginx/default.conf.sample docker/nginx/default.conf
cp app/public/index.php.sample app/public/index.php

echo "セットアップが完了しました！ 'docker-compose up -d' を実行して環境を起動してください。"
echo "http://localhost:8080 にアクセスしてアプリケーションを確認してください。"