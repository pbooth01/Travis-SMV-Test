push_images() {
  export TAGGED_IMAGE=${IMAGE_NAME}:${SEMVER_NEW_TAG}
  export STABLE_IMAGE=${IMAGE_NAME}:stable
  echo ${TAGGED_IMAGE}

  docker build -t ${TAGGED_IMAGE} .
	docker build -t ${STABLE_IMAGE} .

  docker push ${TAGGED_IMAGE}
  docker push ${STABLE_IMAGE}
}
echo ${IMAGE_NAME}
push_images
exit 0
