ARG NODE_VERSION=carbon


FROM node:${NODE_VERSION}-slim

LABEL maintainer='docker@merxnet.io'

ENV BUILD_DEPS='nodejs git make g++ python-virtualenv'
ENV RUN_DEPS='libboost-dev libboost-system-dev libboost-date-time-dev'

RUN apt-get update \
    && apt-get -y install --no-install-recommends ${BUILD_DEPS} ${RUN_DEPS} \
    && git clone https://github.com/MoneroOcean/xmr-node-proxy.git \
    && cd xmr-node-proxy \
    && npm install

WORKDIR /xmr-node-proxy

EXPOSE 3333 8080 8443

ENTRYPOINT ["node"]
CMD ["proxy.js"]
