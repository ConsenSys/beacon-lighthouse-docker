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
	git checkout b7a0feb7253965b1d5e622b6247736ca29e1a254 && \
	make

FROM debian:10-slim

RUN apt-get update && apt-get -y install \
	libssl1.1 jq curl

COPY --from=builder /tmp/lighthouse/target/release/lighthouse /
COPY --from=builder /tmp/lighthouse/target/release/account_manager /

COPY readiness_probe.sh /

EXPOSE 5052
ENTRYPOINT [ "/lighthouse" ]
CMD [ "" ]
