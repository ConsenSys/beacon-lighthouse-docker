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
	make

# TODO Switch to fixed tag
FROM alpine:latest
RUN apk --no-cache add ca-certificates

COPY --from=builder /tmp/lighthouse/target/release/lighthouse /
COPY --from=builder /tmp/lighthouse/target/release/account_manager /

EXPOSE 5052
ENTRYPOINT [ "/lighthouse" ]
CMD [ "" ]
