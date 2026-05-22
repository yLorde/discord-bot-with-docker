COMPOSE ?= docker compose
SERVICE ?= discord-bot

.PHONE: help install build up up-detached down stop restart logs restart-db logs-db logs-app clean-volumes

help:
	@echo "RPG Discord Bot - Makefile"
	@echo "  make install                Install npm dependencies\n"
	@echo "  make build                  Build API image\n"
	@echo "  make up                     Start stack in foreground\n"
	@echo "  make up-detached            Start stack in background\n"
	@echo "  make down                   Stop stack\n"
	@echo "  make stop                   Stop containers\n"
	@echo "  make restart                Restart containers\n"
	@echo "  make logs                   Show container logs\n"
	@echo "  make restart-db             Restart database container\n"
	@echo "  make logs-db                Show database container logs\n"
	@echo "  make logs-app			     Show app container logs\n"
	@echo "  make clean-volumes 		 Remove all volumes\n"

install:
	cd app && npm install

build:
	$(COMPOSE) build app

up:
	$(COMPOSE) up --build

up-detached:
	$(COMPOSE) up -d --build

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart $(SERVICE)

logs:
	$(COMPOSE) logs -f

restart-db:
	$(COMPOSE) restart postgres

logs-db:
	$(COMPOSE) logs -f postgres

logs-app:
	$(COMPOSE) logs -f app

clean-volumes:
	$(COMPOSE) down -v