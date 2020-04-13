# Ethereum 2 client: Lighthouse docker image

Ethereum 2 client, beacon and validator nodes docker images with probes

Upstream repository: https://github.com/sigp/lighthouse

## Usage

 ```docker run --rm -ti -p 5053:5053 -p 5052:5052 -p 5051:5051 -v `mktemp -d`:/root/.lighthouse consensys/lighthouse:latest beacon_node testnet -t 1000 recent 16```

## How to update the image

 1. Watch for recent changelog at https://github.com/prysmaticlabs/prysm/releases
 2. Watch for latest [branches](https://github.com/sigp/lighthouse/branches/active) and issues associated if any
 3. Select the appropriate lighthouse sha256 digest
  - beacon-chain & validator: https://hub.docker.com/r/sigp/lighthouse/tags
 4. Replace digests in the Dockerfile

## How to update the image

Select the appropriate lighthouse sha256 digest and edit the present Dockerfile

## Version

Current version is fixed at **LATEST** at hub.docker.com build time https://github.com/sigp/lighthouse

## Docker-fu

### Debugging

> docker run --rm consensys/lighthouse help
