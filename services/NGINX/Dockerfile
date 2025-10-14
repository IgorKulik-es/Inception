FROM alpine:3.19
WORKDIR /www
COPY	ssl-cert.conf /www/ssl-cert.conf

RUN \
	required="ca-certificates openssl openssl-dev openrc" && \
	apk add $required && \
	apk add nginx && \
	mkdir /etc/ssl/.private && \
	mkdir /etc/ssl/certificates && \
	openssl genrsa -out /etc/ssl/.private/server.key 2048 && \
	openssl req -new -key /etc/ssl/.private/server.key -out /etc/ssl/certificates/cert.csr  -config ssl-cert.conf

EXPOSE	443
#CMD		[ "./hello.sh" ]
