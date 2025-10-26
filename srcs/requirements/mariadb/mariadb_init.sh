#!/bin/sh

mariadbd &

while ! nc -w 1 127.0.0.1 3306 &>/dev/null; do sleep 1 ; done ;

mariadb -e "DELETE FROM mysql.user WHERE User='';"
mariadb -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
mariadb -e "DROP DATABASE IF EXISTS test;"
mariadb -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%'"
mariadb -e "FLUSH PRIVILEGES;"
mariadb -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
mariadb -e "CREATE USER IF NOT EXISTS '$DB_USER_NAME'@'%' IDENTIFIED BY '$DB_USER_PASSWORD';"
mariadb -e "GRANT ALL ON $DB_NAME.* TO '$DB_USER_NAME'@'%';"
mariadb -e "FLUSH PRIVILEGES;"

mysqladmin shutdown -u root