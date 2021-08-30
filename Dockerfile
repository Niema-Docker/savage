# Minimal Docker image for SAVAGE using Alpine base
FROM alpine:3.13.5
MAINTAINER Niema Moshiri <niemamoshiri@gmail.com>

# install SAVAGE
RUN apk update && \
    apk add bash boost-dev g++ make python2 && \
    wget -qO- "https://bitbucket.org/jbaaijens/savage/get/v0.4.0.tar.gz" | tar -zx && \
    mv jbaaijens-savage* /usr/local/bin/SAVAGE && \
    for f in /usr/local/bin/SAVAGE/*.py ; do ln -s $f /usr/local/bin/$(echo $f | rev | cut -d'/' -f1 | rev) ; done && \
    cd /usr/local/bin/SAVAGE && \
    make && \
    cd /
