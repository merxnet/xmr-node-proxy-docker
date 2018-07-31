ARG NODE_VERSION=carbon


FROM node:${NODE_VERSION}-stretch AS build

RUN apt-get update \
    && apt-get -y install --no-install-recommends build-essential cmake git libboost-all-dev python-virtualenv nodejs \
    && git clone https://github.com/MoneroOcean/xmr-node-proxy.git \
    && mkdir build \
    && cp -r xmr-node-proxy/lib/ xmr-node-proxy/package.json xmr-node-proxy/proxy.js build/ \
    && cd build/ \
    && npm install


FROM node:${NODE_VERSION}-stretch

LABEL maintainer='docker@merxnet.io'
COPY --from=build /build /xmr-node-proxy

RUN apt-get update \
    && apt-get -y install --no-install-recommends libboost-all-dev \
    && apt-get -y autoremove \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /xmr-node-proxy

EXPOSE 3333 8080 8443

ENTRYPOINT ["node"]
CMD ["proxy.js"]
