FROM alpine:3.19

WORKDIR /var/www/html
RUN \
	apk add curl php-fpm php-phar php-mysqli php-curl ca-certificates && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./srcs/requirements/wordpress/php.ini /etc/php82/php.ini



ENTRYPOINT [ "sleep", "infinity" ]
