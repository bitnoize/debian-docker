
IMAGENAME := ghcr.io/bitnoize/debian

.PHONY: help build rebuild push pull

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild push pull"

#build: export BUILD_OPTS := ...
build: .build-bookworm

rebuild: export BUILD_OPTS := --pull --no-cache
rebuild: .build-bookworm

.build-bookworm:
	docker build $(BUILD_OPTS) \
		-t "$(IMAGENAME):bookworm" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bookworm \
		.

#push: export PUSH_OPTS := ...
push: .push-bookworm

.push-bookworm:
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"
	docker push $(PUSH_OPTS) "$(IMAGENAME):bookworm"

#pull: export PULL_OPTS := ...
pull: .pull-bookworm

.pull-bookworm:
	docker pull $(PULL_OPTS) "$(IMAGENAME):latest"
	docker pull $(PULL_OPTS) "$(IMAGENAME):bookworm"

