#
# Dockerfile for ShadowsocksR
#

FROM alpine:3.4

ENV SSR_URL https://github.com/shadowsocksr-backup/shadowsocksr/archive/manyuser.zip

RUN set -ex \
    && apk --update add --no-cache libsodium py-pip \
    && pip --no-cache-dir install $SSR_URL \
    && rm -rf /var/cache/apk \
    && pip install M2Crypto

ENV SERVER_ADDR 0.0.0.0
ENV SERVER_PORT 8443
ENV PASSWORD    zanmeidalao
ENV METHOD      chacha20
ENV PROTOCOL    auth_aes128_md5
ENV OBFS        tls1.2_ticket_auth
ENV TIMEOUT     300

EXPOSE $SERVER_PORT/tcp
EXPOSE $SERVER_PORT/udp

WORKDIR /usr/bin/

CMD ssserver -s $SERVER_ADDR \
             -p $SERVER_PORT \
             -k $PASSWORD    \
             -m $METHOD      \
             -O $PROTOCOL    \
             -o $OBFS        \
             -t $TIMEOUT     \
             -G "#10086:sizhaizhenexin,10087:fsx273819,10088:Targeral0416,10089:XGLYswf303,10090:asdqwezxc1995,10091:forever2feiyu,10092:qunshou467646,10093:13886941386,10094:kehan,10100:152212,10101:dong159*,10102:aloha1028"
