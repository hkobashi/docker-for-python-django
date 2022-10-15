# **python(django)** で使用する環境をまとめたもの

- 使い方
```
＜開発環境用コンテナの使い方＞
# docker-compose.ymlで設定した内容でコンテナを立ち上げる
docker-compose -f docker-compose-dev.yml up -d

### 新規でソースコードを作成する場合 ###
# .env_sampleを参考に.envを作成
# Djangoのプロジェクト名は.envで設定した「DJANGO_PROJECT」の値作成すること（次の例だとconfig）
docker-compose -f docker-compose-dev.yml run app django-admin startproject config .
# settings.pyに「STATIC_ROOT」を追記
STATIC_ROOT = '/static/'
# dockerfiles/python/Dockerfile最終行にあるENTRYPOINTをアンコメント
ENTRYPOINT [ "/tmp/entrypoint.sh" ]
# コンテナ起動後「http://localhost:15000」でアクセスできるか確認
docker-compose -f docker-compose-dev.yml up -d

＜本番環境用コンテナの使い方＞
# コンテナ起動後「http://localhost:16000」でアクセスできるか確認
docker-compose -f docker-compose-prd.yml up -d
```

- 各ファイルの説明
```
.
├── README.md # 本ファイル
├── docker-compose-dev.yml # 開発環境用コンテナ設定ファイル（django-mysqlのみ）
├── docker-compose-prd.yml # 本番環境用コンテナ設定ファイル（django-mysql-nginx）
├── dockerfiles # 各コンテナの詳細設定ファイルを格納
│   ├── mysql
│   │   ├── Dockerfile # mysqlのバージョンなどを設定
│   │   ├── init.sql # Djangoで使用するDBユーザーに権限を付与
│   │   └── my.cnf # 文字コードやシステム時刻を設定
│   ├── nginx
│   │   ├── Dockerfile # nginxのバージョンなどを設定
│   │   └── django.conf # リバースプロキシ、静的ファイルの設定
│   └── python
│       ├── Dockerfile # pythonのバージョンなどを設定
│       ├── entrypoint.sh # 本番環境用の起動スクリプト
│       └── requirements.txt # インストールするPythonライブラリ群
└── src # ソースコードを格納するディレクトリ
```