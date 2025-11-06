all: build

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

.PHONY: all build up start down destroy stop restart ps relaunch
