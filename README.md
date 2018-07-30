# Dockerized Cryptonote/Forknote/Cryptonight coin proxy for nodejs-pool

[![GitHub Release](https://img.shields.io/github/release/merxnet/xmr-node-proxy-docker/all.svg)](https://github.com/merxnet/xmr-node-proxy-docker/releases)
[![GitHub Release Date](https://img.shields.io/github/release-date-pre/merxnet/xmr-node-proxy-docker.svg)](https://github.com/merxnet/xmr-node-proxy-docker/releases)
[![Docker Pulls](https://img.shields.io/docker/pulls/merxnet/xmr-node-proxy.svg)](https://hub.docker.com/r/merxnet/xmr-node-proxy/)

The goal for this code is to create a modular and easy-to-use Docker image of the popular Cryptonote/Forknote/Cryptonight coin proxy for nodejs-pool. Discover and support the source code [here](https://github.com/MoneroOcean/xmr-node-proxy).

## Quickstart
The Docker image created by this code is conveniently available on [Docker Hub](https://hub.docker.com/r/merxnet/xmr-node-proxy/).
```
docker pull merxnet/xmr-node-proxy
```
To get started, all you need is a [wallet](https://getmonero.org/resources/user-guides/create_wallet.html) and a [mining pool](https://monero.org/services/mining-pools/) of your choice, such as [MoriaXMR](https://moriaxmr.com/). Using the [example configuration](docs/config.json), create a config file with the appropriate wallet and pool and provide it to the container at runtime:
```
docker run -p 8080:8080 -v config.json:/xmr-node-proxy/config.json:ro merxnet/xmr-node-proxy
```

## Support
Feel free to fork and create pull requests or create issues. Feedback is always welcomed. One can also send donatations to the Monero wallet below.
```
43txUsLN5h3LUKpQFGsFsnRLCpCW7BvT2ZKacsfuqYpUAvt6Po8HseJPwY9ubwXVjySe5SmxVstLfcV8hM8tHg8UTVB14Tk
```
Thank you.
