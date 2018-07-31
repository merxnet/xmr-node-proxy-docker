ARG NODE_VERSION=carbon


FROM node:${NODE_VERSION}-slim

LABEL maintainer='docker@merxnet.io'

COPY lib/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN apt-get update \
    && apt-get -y install --no-install-recommends g++ git libboost-dev libboost-system-dev libboost-date-time-dev make nodejs python-virtualenv \
    && git clone https://github.com/MoneroOcean/xmr-node-proxy.git \
    && mkdir app \
    && cp -r xmr-node-proxy/lib/ xmr-node-proxy/package.json xmr-node-proxy/proxy.js app/ \
    && rm -rf /xmr-node-proxy \
    && cd app/ \
    && npm install \
    && npm cache clean --force \
    && rm -rf /var/lib/apt/lists/* \
    && chmod a+x /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

EXPOSE 3333 8080 8443

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "proxy.js"]
