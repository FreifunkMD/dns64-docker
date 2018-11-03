FROM alpine:3.8

ENV DNS64_PREFIX= \
    DNS64_IP6_LISTEN= \
    DNS64_LISTEN=

COPY entrypoint.sh /entrypoint.sh

RUN set -ex \
	&& apk --no-cache add \
        bind \
    && chmod +x /entrypoint.sh

EXPOSE 53/udp 53/tcp

ENTRYPOINT ["/entrypoint.sh"]

CMD ["named"]		
