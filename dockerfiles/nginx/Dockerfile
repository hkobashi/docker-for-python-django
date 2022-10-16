# Webサーバーとして使用するコンテナ
FROM nginx:1.21-alpine

# システム時刻を日本日時に設定
ENV TZ=Asia/Tokyo

# ローカルのdjango.confをコンテナにコピー
COPY dockerfiles/nginx/django.conf /etc/nginx/conf.d/django.conf