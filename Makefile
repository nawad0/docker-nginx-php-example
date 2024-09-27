include .env.example
install: 
	docker compose up --build -d
start:
	docker compose up -d
stop:
	docker compose stop
terminal:
	docker exec -it ${COMPOSE_PROJECT_NAME}-php-1 sh