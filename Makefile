.PHONY: clean build dist publish test

clean:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	find . -type d -name __pycache__ -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete

build:
	python -m pip install --upgrade pip
	python -m pip install --upgrade build
	python -m build

dist: clean build

test:
	python -m pytest

publish-test: dist
	python -m pip install --upgrade twine
	python -m twine upload --repository testpypi dist/*

publish: dist
	python -m pip install --upgrade twine
	python -m twine upload dist/*

install:
	pip install -e .

install-dev: install
	pip install pytest twine build