FROM debian:stretch-slim

ENV DNS64_PREFIX= \
    DNS64_IP6_LISTEN= \
    DNS64_LISTEN=

COPY entrypoint.sh /entrypoint.sh

RUN set -ex \
	&& apt-get update \
	&& apt-get install -y \
		bind9 \
	&& rm -rf /var/lists/apt/lists/* \
	&& chmod +x /entrypoint.sh

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["named"]

		
