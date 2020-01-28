FROM sigp/lighthouse@sha256:7240c3d40f1a96e1a70154095062c14ee5e4534144c84a03a615ee3e1089370b as builder
MAINTAINER Sylvain Laurent <sylvain.laurent@consensys.net>
LABEL version="0.1"
LABEL description="Ethereum 2 lighthouse client, beacon and validator node"

FROM debian:10-slim

RUN apt-get update && apt-get -y install \
	libssl1.1 jq curl

COPY --from=builder /usr/local/bin/lighthouse /

COPY readiness_probe.sh /

EXPOSE 5051
EXPOSE 5052
EXPOSE 5053
EXPOSE 9000
ENTRYPOINT [ "/lighthouse" ]
CMD [ "" ]
