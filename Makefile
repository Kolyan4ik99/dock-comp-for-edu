
NAME = docker-compose -f srcs/docker-compose.yml

all: build up

up:
	$(NAME) up -d

build:
	$(NAME) build

down:
	$(NAME) down

clean:
	docker volume rm $$(docker volume ls -q)

fclean: 
	docker rmi $$(docker images -qa)
	docker network rm $$(docker network ls -q)

re: clean fclean all
