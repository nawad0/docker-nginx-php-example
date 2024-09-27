install: 
	cd docker; test -f .env || cat .env.example > .env; test -f compose.override.yml\
	|| cat compose.override.example.yml > compose.override.yml; docker compose build; 
start: 
	cd docker; test -f .env || cat .env.example > .env; test -f compose.override.yml\
	|| cat compose.override.example.yml > compose.override.yml; docker compose up -d
stop: 
	cd docker; docker compose stop
terminal: 
	cd docker; docker compose exec php sh
down: 
	cd docker; docker compose down
