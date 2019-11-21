# Ethereum 2 client: Lighthouse docker image

Ethereum 2 client, beacon and validator nodes docker images with probes

Upstream repository: https://github.com/sigp/lighthouse

## Usage

 ```docker run --rm -ti -p 5053:5053 -p 5052:5052 -p 5051:5051 -v `mktemp -d`:/root/.lighthouse consensys/lighthouse:spec-v0.9.1 beacon_node testnet -t 1000 recent 16```

## Version

Current version is fixed at https://github.com/sigp/lighthouse/commit/24e941d175a7455209c140157bf8d5d588c87ba1

## Docker-fu

### Debugging

> docker run --rm consensys/lighthouse help
