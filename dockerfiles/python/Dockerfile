# プログラムのランタイム環境として使用するコンテナ
FROM python:3.9.13-slim AS builder

ENV LANG C.UTF-8 \
  PYTHONUNBUFFERED 1 \
  PYTHONDONTWRITEBYTECODE=1

# ソースコード配置用ディレクトリ作成
RUN mkdir -p /src
WORKDIR /src

# MySQL接続に必要なモジュールなどをインストール
RUN echo "Acquire::http::Pipeline-Depth 0;" >> /etc/apt/apt.conf.d/99fixbadproxy && \
echo "Acquire::http::No-Cache true;" >> /etc/apt/apt.conf.d/99fixbadproxy && \
echo "Acquire::BrokenProxy    true;" >> /etc/apt/apt.conf.d/99fixbadproxy
RUN apt-get update --fix-missing && \
    apt-get -y install gcc libmariadb-dev gunicorn

# 指定したライブラリをインストール
RUN mkdir -p /tmp
COPY ./dockerfiles/python/* /tmp/
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt

#COPY ./dockerfiles/python/ /tmp/
RUN chmod +x /tmp/entrypoint.sh 

# ソースコード取得
COPY src/ .

# ポート5000で外部からの通信を受け付ける
# EXPOSE 5000

ENTRYPOINT [ "/tmp/entrypoint.sh" ]