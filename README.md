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
docker run -p 3333:3333 -v config.json:/app/config.json:ro merxnet/xmr-node-proxy
```

## Using SSL/TLS
In order to securely connect to the proxy (e.g., over the Internet), the proxy can be configured to use HTTPS (SSL/TLS). First, modify the configuration file to use SSL -- that is, under `listeningPorts`, make sure the value of `ssl` is `true`. Next, use `openssl` to generate a self-signed certificate:
```
openssl req -subj "/C=IT/ST=Pool/L=Daemon/O=Mining Pool/CN=mining.proxy" -newkey rsa:2048 -nodes -keyout cert.key -x509 -out cert.pem -days 36500
```
Feel free to modify values as needed. The `cert.key` and `cert.pem` must then be passed to the container at runtime:
```
docker run -p 8443:8443 -v config.json:/app/config.json:ro -v cert.key:/app/cert.key:ro -v cert.pem:/app/cert.pem:ro merxnet/xmr-node-proxy
```

## Support
Feel free to fork and create pull requests or create issues. Feedback is always welcomed. One can also send donatations to the Monero wallet below.
```
43txUsLN5h3LUKpQFGsFsnRLCpCW7BvT2ZKacsfuqYpUAvt6Po8HseJPwY9ubwXVjySe5SmxVstLfcV8hM8tHg8UTVB14Tk
```
Thank you.
