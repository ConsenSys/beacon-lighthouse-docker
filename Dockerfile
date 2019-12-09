# TODO Switch to fixed tag
FROM sigp/lighthouse:latest as builder
MAINTAINER Sylvain Laurent <sylvain.laurent@consensys.net>
LABEL version="0.1"
LABEL description="Ethereum 2 lighthouse client, beacon and validator node"

FROM debian:10-slim

RUN apt-get update && apt-get -y install \
	libssl1.1 jq curl

COPY --from=builder /lighthouse/target/release/lighthouse /

COPY readiness_probe.sh /

EXPOSE 5051
EXPOSE 5052
EXPOSE 5053
EXPOSE 9000
ENTRYPOINT [ "/lighthouse" ]
CMD [ "" ]
