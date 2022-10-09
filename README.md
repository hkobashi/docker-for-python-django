# **python(django)**で使用する環境をまとめたもの

###　使用コマンド
```
- docker-compose up -d
# docker-compose.ymlで設定した内容でコンテナを立ち上げる
- 
```

# 各ファイルの説明
```
.
├── Dockerfiles
│   ├── mysql
│   │   ├── Dockerfile
│   │   └── my.cnf
│   ├── nginx
│   │   ├── default.conf
│   │   └── uwsgi_params
│   └── python
│       ├── Dockerfile
│       └── requirements.txt
├── README.md
└── docker-compose.yml
```