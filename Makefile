
run: build
	docker run -it --rm alpine-dev-container /bin/sh

build:
	docker build -t alpine-dev-container .
