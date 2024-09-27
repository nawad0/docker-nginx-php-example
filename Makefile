install: 
	docker compose up --build
start:
	docker compose up -d
stop:
	docker compose stop
terminal:
	docker exec -it my_app-php-1 sh