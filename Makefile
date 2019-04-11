IMAGE_NAME?=intersystemsdc/irisdemo-base-irishealthint-community:2019.1.0-released-community
IRIS_PROJECT_FOLDER_NAME?=irisdemo-base-irishealthint-community-atelier-project
GITEMAIL?=$GITEMAIL
GITUSERNAME?=$GITUSERNAME

build:
	docker build --build-arg IRIS_PROJECT_FOLDER_NAME=$(IRIS_PROJECT_FOLDER_NAME) -t $(IMAGE_NAME) .

push:
	docker push $(IMAGE_NAME)

version:
	git config --global user.email $(GITEMAIL)
  git config --global user.name $(GITUSERNAME)
	curl https://gist.githubusercontent.com/lxhunter/9d4310462b6972a3f57b5f914543fd51/raw/semver.sh | bash
