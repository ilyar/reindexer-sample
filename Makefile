SHELL=/bin/bash -o pipefail

REGISTRY=local
REPO=$(REGISTRY)/app
VERSION=$(shell git describe --tags --always --dirty)
DEVELOP_IMAGE=$(REPO):develop
REINDEXER_VERSION=$(shell cat go.mod | grep reindexer | cut -d"v" -f2 | cut -d"+" -f1)
REINDEXER_IMAGE=$(REPO):reindexer
REINDEXER_IMAGE_ALIAS=$(REINDEXER_IMAGE)-$(REINDEXER_VERSION)
REINDEXER_BRANCH=v$(REINDEXER_VERSION)

RELEASE_IMAGE=$(REPO):$(VERSION)
RELEASE_IMAGE_ALIAS=$(REPO)

run: release
	docker run --rm -it ${RELEASE_IMAGE}
release: develop
	docker build \
		--tag ${RELEASE_IMAGE_ALIAS} \
		--tag ${RELEASE_IMAGE} .
reindexer:
	docker build \
		--build-arg REINDEXER_BRANCH=${REINDEXER_BRANCH} \
		--tag ${REINDEXER_IMAGE} \
		--tag ${REINDEXER_IMAGE_ALIAS} \
		build/reindexer
reindexer-dev:
	docker build \
		--build-arg REINDEXER_BRANCH=${REINDEXER_BRANCH} \
		--tag ${REINDEXER_IMAGE}-dev \
		build/reindexer-dev
develop: reindexer
	docker build \
		--tag ${DEVELOP_IMAGE} \
		build/develop
bash: develop
	docker run --rm -it -v ${PWD}:/app ${DEVELOP_IMAGE} bash
build-sample:
	go build cmd/sample/*.go

