COMPOSE ?= docker compose

.PHONE: help install run build up up-detached up-db up-detached down stop restart logs restart-db logs-db logs-app clean-volumes

help:
	@echo "RPG Discord Bot - Makefile"
	@echo "  make install                Install npm dependencies\n"
	@echo "  make run                    Run app\n"
	@echo "  make build                  Build API image\n"
	@echo "  make up                     Start stack in foreground\n"
	@echo "  make up-detached            Start stack in background\n"
	@echo "  make up-db                  Start database container\n"
	@echo "  make up-db-detached         Start database container in background\n"
	@echo "  make down                   Stop stack\n"
	@echo "  make stop                   Stop containers\n"
	@echo "  make restart                Restart containers\n"
	@echo "  make logs                   Show container logs\n"
	@echo "  make restart-db             Restart database container\n"
	@echo "  make logs-db                Show database container logs\n"
	@echo "  make logs-app			     Show app container logs\n"
	@echo "  make clean-volumes 		 Remove all volumes\n"

install:
	cd apps/bot && npm install

run:
	node --env-file=.env apps/bot/src/index.js

build:
	$(COMPOSE) build discord-bot 

up:
	$(COMPOSE) up --build

up-detached:
	$(COMPOSE) up -d --build

up-db:
	$(COMPOSE) up -d --build postgres

up-db-detached:
	$(COMPOSE) up -d postgres

down:
	$(COMPOSE) down

stop:
	$(COMPOSE) stop

restart:
	$(COMPOSE) restart discord-bot

logs:
	$(COMPOSE) logs -f

restart-db:
	$(COMPOSE) restart postgres

logs-db:
	$(COMPOSE) logs -f postgres

logs-app:
	$(COMPOSE) logs -f bot

clean-volumes:
	$(COMPOSE) down -v