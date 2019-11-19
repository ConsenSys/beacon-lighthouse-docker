# TODO Switch to fixed tag
FROM sigp/lighthouse:latest
MAINTAINER Sylvain Laurent <sylvain.laurent@consensys.net>
LABEL version="0.1"
LABEL description="Ethereum 2 client, beacon and validator node"

WORKDIR /tmp

USER 1001

RUN git clone https://github.com/sigp/lighthouse.git && \
	cd lighthouse && \
	make

# TODO Switch to fixed tag
FROM alpine:latest
RUN apk --no-cache add ca-certificates

COPY --from=0 /tmp/lighthouse/target/release/beacon_node /
COPY --from=0 /tmp/lighthouse/target/release/account_manager /

EXPOSE 5052
ENTRYPOINT [ "/beacon_node" ]
CMD [ "" ]
