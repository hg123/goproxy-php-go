FROM golang:alpine
RUN apk add --no-cache curl && \
    curl -L "https://github.com/523860169/gop-php-go/archive/master.tar.gz" | gzip -d | tar xv && \
    cd gop-php-go-master && \
    env CGO_ENABLED=0 \
    go build -v -ldflags="-s -w" -o goproxy-php

FROM alpine:3.5
COPY goproxy-php goproxy-php
EXPOSE 8080
ENTRYPOINT goproxy-php
