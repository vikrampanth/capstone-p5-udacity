## The Makefile includes instructions on environment setup and lint tests

setup:
	# Create python virtualenv & source it
	source ~/.devops/bin/activate

install:
	# This should be run from inside a virtualenv
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		chmod +x ./hadolint

test:
	# Additional, optional, tests could go here
	# python -m pytest tests/*.py
	# python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv

all: install lint test
