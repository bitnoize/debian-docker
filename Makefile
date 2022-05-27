
IMAGENAME="bitnoize/debian-backports"

.PHONY: help build push test-shell all

help:
	@echo "Makefile commands:"
	@echo
	@echo "build"
	@echo "push"
	@echo "test-shell"
	@echo "all"

.DEFAULT_GOAL := all

build:
	docker build --pull --no-cache -t "$(IMAGENAME):bullseye" -t "$(IMAGENAME):latest" .

push:
	docker push "$(IMAGENAME):latest"
	docker push "$(IMAGENAME):bullseye"

test-shell:
	docker run -it --rm --name test-debian-backports bitnoize/debian-backports:bullseye

all: build push

