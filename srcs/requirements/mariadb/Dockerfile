FROM alpine:3.19

RUN \
	apk add mariadb mariadb-client && \
	mkdir -p /var/lib/mysql && \
	mkdir -p /run/mysqld && \
	touch /run/mysqld/mysqld.pid /run/mysqld/mysqld.sock && \
	chmod 777 /var/lib/mysql && \
	chown mysql:mysql /var/lib/misc && \
	chown mysql:mysql /var/lib/mysql && \
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	#cd '/usr' ; /usr/bin/mariadbd-safe --datadir='/var/lib/mysql'

WORKDIR /run/mysqld

COPY mariadb_init.sh mariadb_init.sh
COPY my.cnf /etc/my.cnf.d/custom_settings.conf

RUN chmod 777 mariadb_init.sh

ENTRYPOINT [ "/run/mysqld/mariadb_init.sh", "mariadbd", "--user=root" ]
