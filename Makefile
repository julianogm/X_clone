up:
	docker compose up -d
down:
	docker compose down --remove-orphans
restart:
	docker compose down --remove-orphans && docker compose up -d