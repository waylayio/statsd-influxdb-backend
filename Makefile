PROJECT_ID=quiet-mechanic-140114
IMAGE_NAME=waylay-statsd
VERSION=latest
PROJECT=eu.gcr.io/${PROJECT_ID}

all: build

build:
	docker build -t ${PROJECT}/${IMAGE_NAME}:${VERSION} .

publish:
	gcloud docker -- push ${PROJECT}/${IMAGE_NAME}:${VERSION}

.PHONY: all build publish