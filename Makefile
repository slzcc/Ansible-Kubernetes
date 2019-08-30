SHELL := /bin/bash

DockerHubRepoName := "slzcc"
ProjectName := "crane"
VERSION := "v1.15.3.0"
CRANE_ENTRANCE := "main.yml"

build:
	@docker build -t ${DockerHubRepoName}/${ProjectName}:$(VERSION) . --no-cache
push:
	@docker push ${DockerHubRepoName}/${ProjectName}:$(VERSION)
run_main:
	@docker run --rm -i -v ~/.ssh:/root/.ssh -v ${PWD}/nodes:/crane/nodes -v ${PWD}/group_vars:/carne/group_vars ${DockerHubRepoName}/${ProjectName}:$(VERSION) -i nodes ${CRANE_ENTRANCE} -vv