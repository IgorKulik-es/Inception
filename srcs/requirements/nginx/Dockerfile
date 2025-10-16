FROM alpine:3.19
WORKDIR /www

RUN \
	required="ca-certificates openssl openssl-dev openrc" && \
	apk add $required && \
	apk add nginx && \
	mkdir -p /root/.ssh

COPY	.secrets /root/.ssh
COPY	./srcs/requirements/nginx/index.html index.html
COPY	./srcs/requirements/nginx/nginx.conf /etc/nginx/nginx.conf
COPY	./srcs/requirements/nginx/nginx-server.conf /etc/nginx/http.d/nginx-server.conf

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
