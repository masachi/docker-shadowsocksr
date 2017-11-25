FROM alpine:3.6

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     443
ENV PASSWORD        zanmeidalao
ENV METHOD          chacha20
ENV PROTOCOL        auth_aes128_md5
ENV OBFS            tls1.2_ticket_auth
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

ARG BRANCH=manyuser
ARG WORK=~


RUN apk --no-cache add python \
    libsodium \
    wget \
    git


RUN git clone https://github.com/shadowsocksr-backup/shadowsocksr.git && ls -l /root/shadowsocksr/shadowsocks/


WORKDIR /root/shadowsocksr/shadowsocks


EXPOSE $SERVER_PORT
CMD python server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS -G "#10086:sizhaizhenexin,10087:fsx273819,10088:Targeral0416,10089:XGLYswf303,10090:asdqwezxc1995,10091:forever2feiyu,10092:qunshou467646,10093:13886941386,10094:kehan,10100:152212,10101:dong159*,10102:aloha1028"
