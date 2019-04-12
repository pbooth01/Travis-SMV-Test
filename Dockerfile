FROM alpine

RUN apk update && \
    apk add curl

ENTRYPOINT [ "sh", "-c", "echo $HOME" ]
