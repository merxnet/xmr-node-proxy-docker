ARG NODE_VERSION=carbon


FROM node:${NODE_VERSION}-stretch AS build

RUN apt-get update \
    && apt-get -y install --no-install-recommends build-essential cmake git libboost-all-dev python-virtualenv \
    && git clone https://github.com/MoneroOcean/xmr-node-proxy.git \
    && mkdir build \
    && cp -r xmr-node-proxy/lib/ xmr-node-proxy/package.json xmr-node-proxy/proxy.js build/ \
    && cd build/ \
    && npm install


FROM node:${NODE_VERSION}-alpine

LABEL maintainer='docker@merxnet.io'
COPY --from=build /build /xmr-node-proxy

RUN apk update && apk add --no-cache boost-dev

WORKDIR /xmr-node-proxy

EXPOSE 3333 8080 8443

ENTRYPOINT ["node"]
CMD ["proxy.js"]
