
.PHONY: install
install:
	poetry install --no-dev

.PHONY: install-dev
install-dev:
	poetry install

.PHONY: start
start:
	poetry run uvicorn main:app --app-dir src/app

.PHONY: debug
debug:
	poetry run uvicorn main:app --app-dir src/app --reload

.PHONY: test
test:
	poetry run pytest src/tests

.PHONY: build
build:
	docker-compose -f docker/docker-compose.yml build  

.PHONY: run
run:
	docker run -e MAX_WORKERS=2 -p 80:80 python_api

.PHONY: up
up: 
	docker-compose -f docker/docker-compose.yml up

