FROM debian:jessie

ENV SERVER_ADDR     0.0.0.0
ENV SERVER_PORT     443
ENV PASSWORD        zanmeidalao
ENV METHOD          chacha20
ENV PROTOCOL        auth_chain_a
ENV OBFS            tls1.2_ticket_auth
ENV TIMEOUT         300
ENV DNS_ADDR        8.8.8.8
ENV DNS_ADDR_2      8.8.4.4

ARG BRANCH=manyuser
ARG WORK=~


RUN apt-get update && apt-get install python \
    wget \
    git \
    python-m2crypto \
    vim \
    -y
    
RUN apt-get install build-essential -y \
    && wget https://download.libsodium.org/libsodium/releases/LATEST.tar.gz \
    && tar xf LATEST.tar.gz && cd libsodium* \
    && ./configure && make && make install \
    && ldconfig


RUN wget -N --no-check-certificate "https://github.com/ToyoDAdoubi/shadowsocksr/archive/manyuser.tar.gz" \
    && tar -xzvf manyuser.tar.gz


WORKDIR /shadowsocksr-manyuser/shadowsocks/


EXPOSE $SERVER_PORT
EXPOSE 80
CMD python server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS -G 
