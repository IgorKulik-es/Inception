#!/bin/sh

initialize_users()
{
	local $(cat /run/secrets/wp_secrets | awk 'NR==1 {print$0}')
	local $(cat /run/secrets/wp_secrets | awk 'NR==2 {print$0}')
	local $(cat /run/secrets/wp_secrets | awk 'NR==3 {print$0}')
	local $(cat /run/secrets/wp_secrets | awk 'NR==4 {print$0}')
	local $(cat /run/secrets/wp_secrets | awk 'NR==5 {print$0}')
	local $(cat /run/secrets/wp_secrets | awk 'NR==6 {print$0}')
	wp core install \
		--url=${DOMAIN_NAME} \
		--title=${WP_TITLE} \
		--admin_user=${WP_ADMIN_NAME} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL} \
		--skip-email
	wp user create  ${WP_AUTHOR_USER} ${WP_AUTHOR_EMAIL} \
		--user_pass=${WP_AUTHOR_PASSWORD} \
		--role=author
}
initialize_users

exec "$@"

