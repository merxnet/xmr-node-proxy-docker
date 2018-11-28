ARG NODE_VERSION=carbon


FROM node:${NODE_VERSION}-slim

LABEL maintainer='docker@merxnet.io'

ENV COMMIT 'b93ff42db816892f39f967e333de692b2f0a86ae'

RUN apt-get update \
    && apt-get -y install --no-install-recommends g++ git libboost-dev libboost-system-dev libboost-date-time-dev make nodejs python-virtualenv \
    && git clone https://github.com/MoneroOcean/xmr-node-proxy.git \
    && cd xmr-node-proxy \
    && git checkout ${COMMIT} \
    && cd .. \
    && mkdir app \
    && cp -r xmr-node-proxy/lib/ xmr-node-proxy/package.json xmr-node-proxy/proxy.js app/ \
    && rm -rf /xmr-node-proxy \
    && cd app/ \
    && npm install \
    && npm cache clean --force \
    && rm -rf /var/lib/apt/lists/*

COPY lib/docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

WORKDIR /app

EXPOSE 3333 8081 9000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["node", "proxy.js"]
