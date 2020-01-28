# Ethereum 2 client: Lighthouse docker image

Ethereum 2 client, beacon and validator nodes docker images with probes

Upstream repository: https://github.com/sigp/lighthouse

## Usage

 ```docker run --rm -ti -p 5053:5053 -p 5052:5052 -p 5051:5051 -v `mktemp -d`:/root/.lighthouse consensys/lighthouse:latest beacon_node testnet -t 1000 recent 16```

## How to update the image

Select the appropriate lighthouse sha256 digest and edit the present Dockerfile

## Version

Current version is fixed at **LATEST** at hub.docker.com build time https://github.com/sigp/lighthouse

## Docker-fu

### Debugging

> docker run --rm consensys/lighthouse help
