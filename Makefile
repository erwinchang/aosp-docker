DOCKER = docker
IMAGE = erwinchang/aosp-442

aosp: Dockerfile
	$(DOCKER) build -t $(IMAGE) .

all: aosp

.PHONY: all
