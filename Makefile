# Current version
VERSION ?= 0.0.2

vendoring:
	go get -u github.com/kardianos/govendor
	govendor sync

build: vendoring
	env GOOS=linux GOARCH=amd64 go build .

dockerhub-db:
	cd ./db && unzip ./mifbooks.sql.zip

	cd ./db && docker build --no-cache=true -t webdeva/mif-postgresql:$(VERSION) -f ./Dockerfile .
	docker push webdeva/mif-postgresql:$(VERSION)

	cd ./db && docker build --no-cache=true -t webdeva/mif-postgresql:latest -f ./Dockerfile .
	docker push webdeva/mif-postgresql:latest

dockerhub-app: build
	docker build --no-cache=true -t webdeva/mif-app:$(VERSION) -f ./Dockerfile .
	docker push webdeva/mif-app:$(VERSION)

	docker build --no-cache=true -t webdeva/mif-app:latest -f ./Dockerfile .
	docker push webdeva/mif-app:latest

dockerhub: dockerhub-db dockerhub-app
