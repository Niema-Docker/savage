# Minimal Docker image for SAVAGE using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install SAVAGE
RUN apk update && \
    apk add bash boost-dev g++ make python2 && \
    wget -qO- "https://bitbucket.org/jbaaijens/savage/get/v0.4.0.tar.gz" | tar -zx && \
    mv jbaaijens-savage* /usr/local/bin/SAVAGE && \
    echo -e '#!/usr/bin/env bash\nFULL_PATH=$(realpath $0)\ncd $(dirname $FULL_PATH)/SAVAGE\n./savage.py "$@"' > /usr/local/bin/savage && \
    chmod a+x /usr/local/bin/savage && \
    cd /usr/local/bin/SAVAGE && make && cd / && \
    
