FROM alpine:3.19

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/local/:/usr/sbin:/usr/bin:/sbin:/bin
RUN \
	apk add curl php-fpm php-phar php-mysqli php-curl ca-certificates && \
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	cp wp-cli.phar /usr/local/bin/wp

COPY ./srcs/requirements/wordpress/php.ini /etc/php82/php.ini


#ENTRYPOINT [ "/bin/sh", "tail" ]
