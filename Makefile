install: 
	docker compose build
start:
	docker compose up -d
stop:
	docker compose stop
terminal:
	docker compose exec php sh