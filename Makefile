
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