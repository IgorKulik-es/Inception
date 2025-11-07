FROM alpine:3.19

RUN \
	apk add mariadb mariadb-client && \
	mkdir -p /var/lib/mysql
RUN \
	chown mysql:mysql /var/lib/mysql && \
	chmod -R 777 /var/lib/mysql && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
RUN \
	mkdir -p /run/mysqld/mysql && \
	chown mysql:mysql /run/mysqld/mysql && \
	chmod -R 777 /run/mysqld && \
	touch /run/mysqld/mysqld.pid /run/mysqld/mysqld.sock && \
	chown mysql:mysql /run/mysqld/mysqld.pid /run/mysqld/mysqld.sock && \
	rm -rf /etc/my.cnf.d/mariadb-server.cnf

WORKDIR /www

COPY ./tools/mariadb_init.sh mariadb_init.sh
COPY ./conf/my.cnf /etc/my.cnf

RUN chmod 777 mariadb_init.sh && \
	chmod 644 /etc/my.cnf
RUN --mount=type=secret,id=db_secrets ./mariadb_init.sh

ENTRYPOINT [ "mariadbd" ]
