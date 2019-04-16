push_images() {
  SEMVER_NEW_TAG=$1
  echo $SEMVER_NEW_TAG
  TAGGED_IMAGE=${IMAGE_NAME}:$SEMVER_NEW_TAG
  STABLE_IMAGE=${IMAGE_NAME}:stable
  echo ${TAGGED_IMAGE}

  docker build -t $TAGGED_IMAGE .
	docker build -t $STABLE_IMAGE .

  docker push $TAGGED_IMAGE
  docker push $STABLE_IMAGE
}

push_images
exit 0
