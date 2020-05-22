#!/bin/sh

RX_ARGS="--db $RX_STORAGE"
RX_ARGS="$RX_ARGS --httpaddr 0:9088"
RX_ARGS="$RX_ARGS --rpcaddr 0:6534"
RX_ARGS="$RX_ARGS --webroot /usr/local/share/reindexer/web"
RX_ARGS="$RX_ARGS --corelog $RX_CORELOG"
RX_ARGS="$RX_ARGS --serverlog $RX_SERVERLOG"
RX_ARGS="$RX_ARGS --httplog $RX_HTTPLOG"
RX_ARGS="$RX_ARGS --rpclog $RX_RPCLOG"
RX_ARGS="$RX_ARGS --loglevel $RX_LOGLEVEL"

mkdir -p $RX_STORAGE

if [ -n "$RX_PPROF" ]; then
    RX_ARGS="$RX_ARGS --pprof --allocs"
    export TCMALLOC_SAMPLE_PARAMETER=512000
    export MALLOC_CONF=prof:true
fi

if [ -n "$RX_SECURITY" ]; then
    RX_ARGS="$RX_ARGS --security"
fi

if [ -z "$*" ]; then
   reindexer_server $RX_ARGS
else 
   exec "$@"
fi
