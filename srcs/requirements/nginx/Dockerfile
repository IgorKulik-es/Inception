FROM alpine:3.19
WORKDIR /www

RUN \
	apk add ca-certificates openssl openssl-dev openrc nginx && \
	mkdir -p /root/.ssh

RUN		--mount=type=secret,id=ssh_secrets tar -xvf /run/secrets/ssh_secrets -C /root/.ssh/
COPY	./conf/nginx.conf /etc/nginx/nginx.conf
COPY	./conf/nginx-server.conf /etc/nginx/http.d/nginx-server.conf
CMD		["/usr/sbin/nginx", "-g", "daemon off;"]
