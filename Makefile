#* Variables
SHELL := /usr/bin/env bash
PYTHON := python3
PYTHONPATH := `pwd`
DOCS_URL := https://durrantlab.github.io/nnscore




#* Poetry
.PHONY: poetry-download
poetry-download:
	curl -sSL https://install.python-poetry.org | $(PYTHON) -

.PHONY: poetry-remove
poetry-remove:
	curl -sSL https://install.python-poetry.org | $(PYTHON) - --uninstall




#* Installation
.PHONY: install
install:
	poetry lock --no-interaction
	poetry export --without-hashes > requirements.txt
	poetry install --no-interaction
	-poetry run mypy --install-types --non-interactive ./nnscore

.PHONY: pre-commit-install
pre-commit-install:
	poetry run pre-commit install

.PHONY: validate
validate:
	poetry run pre-commit run --all-files



#* Formatters
.PHONY: codestyle
codestyle:
	poetry run pyupgrade --exit-zero-even-if-changed --py39-plus **/*.py
	poetry run isort --settings-path pyproject.toml ./
	poetry run black --config pyproject.toml ./

.PHONY: formatting
formatting: codestyle




#* Linting
.PHONY: test
test:
	PYTHONPATH=$(PYTHONPATH) poetry run pytest -c pyproject.toml --cov-report=html --cov=nnscore tests/
	poetry run coverage-badge -o assets/images/coverage.svg -f

.PHONY: check-codestyle
check-codestyle:
	poetry run isort --diff --check-only --settings-path pyproject.toml ./
	poetry run black --diff --check --config pyproject.toml ./
	-poetry run pylint nnscore

.PHONY: mypy
mypy:
	poetry run mypy --config-file pyproject.toml ./

.PHONY: check-safety
check-safety:
	poetry check
	poetry run safety check --full-report
	poetry run bandit -ll --recursive nnscore tests

.PHONY: lint
lint: test check-codestyle mypy check-safety



#* Cleaning
.PHONY: pycache-remove
pycache-remove:
	find . | grep -E "(__pycache__|\.pyc|\.pyo$$)" | xargs rm -rf

.PHONY: dsstore-remove
dsstore-remove:
	find . | grep -E ".DS_Store" | xargs rm -rf

.PHONY: mypycache-remove
mypycache-remove:
	find . | grep -E ".mypy_cache" | xargs rm -rf

.PHONY: ipynbcheckpoints-remove
ipynbcheckpoints-remove:
	find . | grep -E ".ipynb_checkpoints" | xargs rm -rf

.PHONY: pytestcache-remove
pytestcache-remove:
	find . | grep -E ".pytest_cache" | xargs rm -rf

.PHONY: build-remove
build-remove:
	rm -rf build/

.PHONY: cleanup
cleanup: pycache-remove dsstore-remove mypycache-remove ipynbcheckpoints-remove pytestcache-remove



#* Documentation
.PHONY: docs
docs:
	rm -rf ./docs/html/
	poetry run sphinx-build -nT ./docs/source/ ./docs/html/
	touch ./docs/html/.nojekyll

.PHONY: open-docs
open-docs:
	xdg-open ./docs/html/index.html 2>/dev/null

.PHONY: docs-multiversion
docs-multiversion:
	rm -rf ./docs/html/
	poetry run sphinx-multiversion -nT ./docs/source/ ./docs/html/
	touch ./docs/html/.nojekyll

	# Create html redirect to main
	echo "<head>" > ./docs/html/index.html
	echo "  <meta http-equiv='refresh' content='0; URL=$(DOCS_URL)/main/index.html'>" >> ./docs/html/index.html
	echo "</head>" >> ./docs/html/index.html
