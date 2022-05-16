.PHONY: build
build:
	docker build . -t madebyais/gcloud-kubectl-helm-dind:latest

.PHONY: push-latest
push-latest:
	docker push madebyais/gcloud-kubectl-helm-dind:latest
