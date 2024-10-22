setup: teardown
	docker build --tag temp-monitor-api-i api/.
	docker build --tag temp-monitor-frontend-i front-end/.
	docker-compose up -d

teardown:
	docker-compose down --remove-orphans
