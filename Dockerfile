ARG NODE_VERSION=carbon


FROM node:${NODE_VERSION}-slim

LABEL maintainer='docker@merxnet.io'

RUN apt-get update \
    && apt-get -y install --no-install-recommends build-essential cmake git libboost-all-dev python-virtualenv nodejs \
    && git clone https://github.com/MoneroOcean/xmr-node-proxy.git \
    && cd xmr-node-proxy \
    && npm install

WORKDIR /xmr-node-proxy

EXPOSE 3333 8080 8443

ENTRYPOINT ["node"]
CMD ["proxy.js"]
