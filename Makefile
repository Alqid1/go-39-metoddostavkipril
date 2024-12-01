PUBLIC_REGISTRY_HOST=docker.io
PUBLIC_REGISTRY_OWNER=alqid1
PUBLIC_REGISTRY_APP_NAME=module-39

CI_COMMIT_REF_NAME=latest

all: deps build test

deps:
	@go mod download
	@echo "Dependencies installed successfully"

build:
	go build ./

test:
	go test -v ./...

lint:
	golangci-lint run ./...

image:
	docker build -t ${PUBLIC_REGISTRY_HOST}/${PUBLIC_REGISTRY_OWNER}/${PUBLIC_REGISTRY_APP_NAME}:${CI_COMMIT_REF_NAME} ./
	docker push ${PUBLIC_REGISTRY_HOST}/${PUBLIC_REGISTRY_OWNER}/${PUBLIC_REGISTRY_APP_NAME}:${CI_COMMIT_REF_NAME}
<<<<<<< HEAD
=======

echo:
	echo New ${PUBLIC_REGISTRY_HOST}/${PUBLIC_REGISTRY_OWNER}/${PUBLIC_REGISTRY_APP_NAME} image ready! Version ${CI_COMMIT_REF_NAME}!
>>>>>>> 890c343a473b2193c4c7135d8c6ac8b972d3227e
