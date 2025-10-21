!#/bin/sh

initialize_wordpress()
{
	wp core download
	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_PASSWORD}
}
