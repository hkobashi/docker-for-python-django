# プログラムのランタイム環境として使用するコンテナ
FROM python:3.9.13-slim AS builder

ENV LANG C.UTF-8 \
  PYTHONUNBUFFERED 1 \
  PYTHONDONTWRITEBYTECODE=1 \
  TZ=Asia/Tokyo


# ソースコード配置用ディレクトリ作成
RUN mkdir -p /src
WORKDIR /src

RUN { \
    echo 'Acquire::http::Pipeline-Depth 0;'; \
    echo 'Acquire::http::No-Cache true;'; \
    echo 'Acquire::BrokenProxy    true;'; \
  } >> /etc/apt/apt.conf.d/99fixbadproxy

RUN apt-get update --fix-missing && \
    apt-get install -y --no-install-recommends gcc libmariadb-dev
    #gunicorn libmariadb-dev

# 指定したライブラリをインストール
COPY ./dockerfiles/python/* /tmp/
RUN pip install --upgrade pip && pip install -r /tmp/requirements.txt
# entrypoint.shに実行権限を付与
RUN chmod +x /tmp/entrypoint.sh

# ソースコード取得
COPY src/ .

#ENTRYPOINT [ "/tmp/entrypoint.sh" ]