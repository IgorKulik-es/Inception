#!/bin/sh

init_wordpress()
{
	local $(cat /run/secrets/db_secrets | awk 'NR==1 {print$0}')
	local $(cat /run/secrets/db_secrets | awk 'NR==2 {print$0}')
	local $(cat /run/secrets/db_secrets | awk 'NR==3 {print$0}')
	wp core download
	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_USER_PASSWORD} --dbhost=mariadb:3306 --skip-check
}

init_wordpress
exec "$@"
