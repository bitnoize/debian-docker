
IMAGENAME="bitnoize/debian-backports"

.PHONY: help build push test

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build push test"

build: .build-bullseye

.build-bullseye:
	docker build --pull --no-cache \
		-t "$(IMAGENAME):bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

push: .push-bullseye

.push-bullseye:
	docker push "$(IMAGENAME):latest"
	docker push "$(IMAGENAME):bullseye"

test:
	docker run -it --rm \
		--name test-debian-backports \
		bitnoize/debian-backports:latest

