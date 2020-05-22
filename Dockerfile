FROM local/app:develop AS build
COPY . .
RUN make build-sample

FROM alpine:3.11
# Libraries used in runtime
RUN apk add --update --no-cache \
    snappy \
    libexecinfo \
    libunwind \
    leveldb
COPY --from=build /app/sample /app/sample
WORKDIR /app
CMD ["/app/sample"]
