FROM alpine:3.19
WORKDIR /www

RUN \
	required="ca-certificates openssl openssl-dev openrc" && \
	apk add $required && \
	apk add nginx && \
	mkdir -p /root/.ssh

COPY ./.private /root/.ssh
COPY index.html index.html
COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx-server.conf /etc/nginx/http.d/nginx-server.conf

CMD	["/usr/sbin/nginx", "-g", "daemon off;"]
