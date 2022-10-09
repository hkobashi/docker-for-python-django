# DBとして使用するコンテナ
FROM mysql:8.0.27

# db情報は.envに記述
ENV TZ=Asia/Tokyo

COPY ./my.cnf /etc/mysql/conf.d/my.cnf
RUN chmod 644 /etc/mysql/conf.d/my.cnf

# db初期クエリ
COPY containers/mysql/init.sql /docker-entrypoint-initdb.d