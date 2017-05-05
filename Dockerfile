FROM golang:alpine
RUN apk update && \
    apk add curl && \
    curl -L "https://github.com/523860169/gop-php-go/archive/master.tar.gz" | gzip -d | tar xv && \
    cd goproxy-server.php-go && \
    env CGO_ENABLED=0 \
    go build -v -ldflags="-s -w" -o /goproxy-php

FROM alpine
COPY --from=0 /goproxy-php /goproxy-php
ENTRYPOINT /goproxy-php
