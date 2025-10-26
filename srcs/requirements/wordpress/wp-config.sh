!#/bin/sh

initialize_wordpress()
{
	wp core download
	wp config create --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_USER_PASSWORD} --dbhost=mariadb:3306
	wp install \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin-user=${WP_ADMIN_NAME} \
		--admin-password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}
	wp create user ${WP_AUTHOR_USER} ${WP_AUTHOR_EMAIL} \
		--user_pass=${WP_AUTHOR_PASSWORD}
		--role=author;
}
