FROM alpine:latest

RUN apk add build-base clang git

RUN clang-format --version
COPY ./hello/* /hello/
RUN clang-format /hello/hello.c > /hello/hello-formatted.c
COPY ./run-diff.sh /usr/bin/
RUN chmod +x /usr/bin/run-diff.sh
ENTRYPOINT ["/usr/bin/run-diff.sh"]
