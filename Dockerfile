FROM alpine:latest

RUN apk add build-base clang git

RUN clang-format --version
COPY ./hello/* /hello/
RUN clang-format /hello/hello.c > /hello/hello-formatted.c
RUN chmod +x ./run-diff.sh
COPY ./run-diff.sh /usr/bin
ENTRYPOINT ["/usr/bin/run-diff.sh"]
