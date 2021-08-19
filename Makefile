## The Makefile includes instructions on environment setup and lint tests

kube:
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	sudo install kubectl /usr/local/bin/kubectl
	sudo service docker start
	git clone https://github.com/vikrampanth/kubernetes_test_dev.git
	cd kubernetes_test_dev && chmod +x resize.sh && ./resize.sh && cd ..
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube
	minikube start

docker-build-kube-run:
	chmod +x run_docker.sh && ./run_docker.sh
	chmod +x upload_docker.sh && ./upload_docker.sh
	chmod +x run_kubernetes.sh && ./run_kubernetes.sh

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
