# include environment variables from a file
-include env

.PHONY: build
build:
	echo "build"

.PHONY: clean
clean:
	echo "clean"

.PHONY: install-pre-commit
install-pre-commit:
	pip install pre-commit
	pre-commit install

.PHONY: lint
lint:
	pre-commit run --all-files
