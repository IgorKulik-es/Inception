THIS_FILE := $(lastword $(MAKEFILE_LIST))

help:
		make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
build:
		docker-compose -f ./srcs/docker-compose.yml build $(c)
up:
		docker-compose -f ./srcs/docker-compose.yml up -d $(c)
start:
		docker-compose -f ./srcs/docker-compose.yml start $(c)
down:
		docker-compose -f ./srcs/docker-compose.yml down $(c)
destroy:
		docker-compose -f ./srcs/docker-compose.yml down -v $(c)
stop:
		docker-compose -f ./srcs/docker-compose.yml stop $(c)
restart:
		docker-compose -f ./srcs/docker-compose.yml stop $(c)
		docker-compose -f ./srcs/docker-compose.yml up -d $(c)
ps:
		docker-compose -f ./srcs/docker-compose.yml ps
relaunch: down build up

.PHONY: help build up start down destroy stop restart ps relaunch
