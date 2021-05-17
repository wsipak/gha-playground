FROM alpine:latest

RUN apk add build-base clang git

RUN clang-format --version
COPY ./hello/* /hello/
RUN clang-format /hello/hello.c > hello-formatted.c
ENTRYPOINT ["git diff"]
CMD ["hello.c hello-formatted.c"]
