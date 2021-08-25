## The Makefile includes instructions on environment setup and lint tests

resize-disk:
	df -h
	chmod +x resize.sh && ./resize.sh
	df -h

ekstl-install:
	curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
	sudo mv /tmp/eksctl /usr/local/bin
	eksctl version

kube-setup:
	curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	sudo install kubectl /usr/local/bin/kubectl
	sudo service docker start
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
	sudo install minikube-linux-amd64 /usr/local/bin/minikube
	minikube start

docker-kube-run:
	docker build -t capstone-image .
	docker image ls
	chmod +x upload_docker.sh && ./upload_docker.sh
	chmod +x run_kubernetes.sh && ./run_kubernetes.sh

venv-setup:
	# Create python virtualenv & source it
	source ~/.devops/bin/activate

hadolint-install:
	# This should be run from inside a virtualenv
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
		chmod +x ./hadolint

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	./hadolint Dockerfile

all: hadolint-install lint
