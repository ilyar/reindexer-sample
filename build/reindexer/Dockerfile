FROM alpine:latest AS build

# Libraries used in the build process of this image
RUN apk --update --no-cache add \
    git

WORKDIR /src

# Build Reindexer
ARG REINDEXER_BRANCH
RUN git clone \
    --branch ${REINDEXER_BRANCH:-master} \
    --depth 1 \
    https://github.com/Restream/reindexer.git

RUN cd reindexer && \
    ./dependencies.sh && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    make --jobs="$(nproc)" && \
    make install

FROM alpine:latest

COPY --from=build /usr/local/include/reindexer /usr/local/include/reindexer
COPY --from=build /usr/local/lib64/pkgconfig/libreindexer* /usr/lib/pkgconfig/
COPY --from=build /usr/local/lib64/libreindexer* /usr/local/lib64/
COPY --from=build /usr/local/bin/reindexer* /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/entrypoint
RUN chmod +x /usr/local/bin/entrypoint

# Libraries used in runtime
RUN apk --update --no-cache add \
    libstdc++ \
    libunwind \
    snappy \
    libexecinfo \
    leveldb

ENV RX_STORAGE /db
ENV RX_CORELOG stdout
ENV RX_HTTPLOG stdout
ENV RX_RPCLOG stdout
ENV RX_SERVERLOG stdout
ENV RX_LOGLEVEL info

EXPOSE 9088 6534
CMD entrypoint
