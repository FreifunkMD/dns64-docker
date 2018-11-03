#!/bin/sh

cat > /etc/bind/named.conf.options <<EOF
options {
        directory "/var/cache/bind";
        auth-nxdomain no;
	listen-on { ${DNS64_IP6_LISTEN}; };
        listen-on-v6 { ${DNS64_IP6_LISTEN}; };
        allow-query { any; };
        dns64 ${DNS64_STATIC_PREFIX} {
                clients { any; };
        };
};
EOF

cat > /etc/bind/named.conf <<EOF
include "/etc/bind/named.conf.options";
#include "/etc/bind/named.conf.local";
#include "/etc/bind/named.conf.default-zones";
EOF

if [ "$1" = 'named' ]; then
  echo "Starting named..."
  exec $(which named) -g
else
  exec "$@"
fi
