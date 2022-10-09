-- MYSQL_USERに権限を付与
GRANT ALL PRIVILEGES ON *.* TO 'django-user'@'%'; -- ユーザーは.envを確認
FLUSH PRIVILEGES;