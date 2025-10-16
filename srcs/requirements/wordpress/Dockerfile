FROM alpine:3.19

RUN \
	required="lighttpd php fcgi php-cgi" && \
	extra="wget php82-mysqli" && \
	apk add $required $extra

COPY lighttpd.conf /etc/lighttpd/lighttpd.conf

