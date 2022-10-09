# プログラムのランタイム環境として使用するコンテナ
FROM python:3.9.13-slim AS builder

ENV LANG C.UTF-8 \
  PYTHONUNBUFFERED 1 \
  PYTHONDONTWRITEBYTECODE=1

# ソースコード配置用ディレクトリ作成
RUN mkdir -p /src
WORKDIR /src

# 指定したライブラリをインストール
COPY requirements.txt /src/
RUN pip install --upgrade pip
RUN pip install -r /src/requirements.txt

# ソースコード取得
COPY . /src/

# ポート5000で外部からの通信を受け付ける
# EXPOSE 5000