
IMAGENAME := bitnoize/debian

.PHONY: help build rebuild

.DEFAULT_GOAL := help

help:
	@echo "Makefile commands: build rebuild"

#build: export BUILD_OPTS := ...
#build: export PUSH_OPTS := ...
build: .build-bullseye .push-bullseye

rebuild: export BUILD_OPTS := --pull --no-cache
#rebuild: export PUSH_OPTS := ...
rebuild: .build-bullseye .push-bullseye

.build-bullseye:
	docker build $(BUILD_OPTS) \
		-t "$(IMAGENAME):bullseye" \
		-t "$(IMAGENAME):latest" \
		-f Dockerfile.bullseye \
		.

.push-bullseye:
	docker push $(PUSH_OPTS) "$(IMAGENAME):latest"
	docker push $(PUSH_OPTS) "$(IMAGENAME):bullseye"

