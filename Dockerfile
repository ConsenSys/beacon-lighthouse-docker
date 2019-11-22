# TODO Switch to fixed tag
FROM sigp/lighthouse:latest as builder
MAINTAINER Sylvain Laurent <sylvain.laurent@consensys.net>
LABEL version="0.1"
LABEL description="Ethereum 2 client, beacon and validator node"

WORKDIR /tmp

USER 1001

# TODO Switch to fixed tag
RUN git clone https://github.com/sigp/lighthouse.git && \
	cd lighthouse && \
	git checkout 24e941d175a7455209c140157bf8d5d588c87ba1 && \
	make

FROM debian:10-slim

RUN apt-get update && apt-get -y install \
	libssl1.1 jq curl

COPY --from=builder /tmp/lighthouse/target/release/lighthouse /

COPY readiness_probe.sh /

EXPOSE 5051
EXPOSE 5052
EXPOSE 5053
ENTRYPOINT [ "/lighthouse" ]
CMD [ "" ]
