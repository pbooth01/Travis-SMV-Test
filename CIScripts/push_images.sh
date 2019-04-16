push_images() {
  echo "Iinsode Push Images"
  echo ${IMAGE_NAME}
  export TAGGED_IMAGE=${IMAGE_NAME}:${SEMVER_NEW_TAG}
  export STABLE_IMAGE=${IMAGE_NAME}:stable
  echo ${TAGGED_IMAGE}

  docker build -t ${TAGGED_IMAGE} .
	docker build -t ${STABLE_IMAGE} .

  docker push ${TAGGED_IMAGE}
  docker push ${STABLE_IMAGE}
}

push_images
exit 0
