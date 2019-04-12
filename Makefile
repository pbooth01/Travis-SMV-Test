IMAGE_NAME?= pbooth01/travis_test1
IMAGE_TAG?=$(SEMVER_NEW_TAG)

TAGGED_IMAGE?=$(IMAGE_NAME):$(IMAGE_TAG)
STABLE_IMAGE?:=$(IMAGE_NAME):stable

#IRIS_PROJECT_FOLDER_NAME?=irisdemo-base-irishealthint-community-atelier-project

#build_docker_images:
#	echo $(TAGGED_IMAGE)
#	docker build -t $(TAGGED_IMAGE) .
#	docker build -t $(STABLE_IMAGE) .
#build:
#	docker build --build-arg IRIS_PROJECT_FOLDER_NAME=$(IRIS_PROJECT_FOLDER_NAME) -t $(IMAGE_NAME) .

#push:
#	docker push $(TAGGED_IMAGE)
#	docker push $(STABLE_IMAGE)

version:
	curl https://raw.githubusercontent.com/pbooth01/Travis-SMV-Test/master/CI.sh | bash
