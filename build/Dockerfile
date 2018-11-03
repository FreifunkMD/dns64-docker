FROM alpine:latest

ARG BIND_VER=9-13-3


RUN set -ex \
	&& apk --no-cache add \
        wget \
        openssl-dev \
        ca-certificates \
        libtool \
        build-base \
        perl-dev \
        libcap-dev \
    && update-ca-certificates \
    && wget https://www.isc.org/downloads/file/bind-${BIND_VER}/?version=tar-gz -O /bind.tar.gz \
    && mkdir /bind \
    && tar -xvf /bind.tar.gz -C /bind --strip-components=1 \
    && mkdir /bind/build \
    && cd /bind/build \
    && ../configure \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --libdir=/usr/lib/ \
        --infodir=/usr/share/info \
        --sysconfdir=/etc/bind \
        --localstatedir=/ \
        --enable-threads \
        --enable-largefile \
        --with-libtool \
        --enable-shared \
        --enable-static \
        --with-gost=no \
        --with-openssl=/usr \
        --with-atf=no \
        --enable-ipv6 \
        --enable-rrl \
        --enable-filter-aaaa \
        --with-randomdev=/dev/urandom \
    && make -j$(nproc) \
    && make install 

#FROM alpine:latest
#
#ENV DNS64_PREFIX= \
#    DNS64_IP6_LISTEN= \
#    DNS64_LISTEN=
#
#COPY entrypoint.sh /entrypoint.sh
#
#EXPOSE 53/udp 53/tcp
#
#ENTRYPOINT ["/entrypoint.sh"]
#
#CMD ["named"]		
