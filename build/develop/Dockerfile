FROM golang:1.14-alpine AS golang
FROM local/app:reindexer

# Installs Golang
COPY --from=golang /usr/local/go /usr/local/go
ENV GOROOT /usr/local/go
ENV GOPATH /go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

# Libraries used in the build process of this image
RUN apk --update --no-cache add \
    snappy-dev \
    leveldb-dev \
    libexecinfo-dev \
    libunwind-dev \
    pkgconfig \
    build-base \
    bash

WORKDIR /app

CMD bash
