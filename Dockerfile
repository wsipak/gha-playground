FROM alpine:latest

RUN apk add build-base clang git

RUN clang-format --version
COPY * /format-check/
RUN clang-format /format-check/hello/hello.c > /format-check/hello/hello-formatted.c
RUN chmod +x /format-check/run-diff.sh
ENTRYPOINT ["/format-check/run-diff.sh"]
