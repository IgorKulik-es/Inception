FROM alpine:3.19

WORKDIR /var/www/html
RUN \
	apk add curl php-fpm php-phar php-mysqli php-curl php-json php-mbstring ca-certificates && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY --chmod=700 ./srcs/requirements/wordpress/wp_install.sh wp_install.sh
COPY ./srcs/requirements/wordpress/php.ini /etc/php82/php.ini
COPY ./srcs/requirements/wordpress/www.conf /etc/php82/php-fpm.d/www.conf
COPY --chmod=700 ./srcs/requirements/wordpress/wp_init.sh wp_init.sh
RUN --mount=type=secret,id=db_secrets ./wp_install.sh


RUN adduser -S www-data && \
	addgroup www-data www-data

ENTRYPOINT [ "./wp_init.sh", "php-fpm82", "-F" ]
