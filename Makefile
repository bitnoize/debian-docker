
IMAGENAME="bitnoize/debian-backports"

.PHONY: help build push pull shell

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build push pull shell"

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

pull: .pull-bullseye

.pull-bullseye:
	docker pull "$(IMAGENAME):latest"
	docker pull "$(IMAGENAME):bullseye"

shell:
	docker run -it --rm \
		--name debian-backports-shell \
		bitnoize/debian-backports:latest

