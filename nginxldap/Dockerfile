FROM ubuntu:14.04

RUN apt-get update && apt-get install wget git-core build-essential libldap2-dev libssl-dev libpcre3-dev -y

WORKDIR /work

RUN wget http://nginx.org/download/nginx-1.7.9.tar.gz
RUN tar -xzf nginx-1.7.9.tar.gz && rm nginx-1.7.9.tar.gz

RUN git clone https://github.com/kvspb/nginx-auth-ldap.git

#TODO fix configuration to imitate apt-get install
WORKDIR /work/nginx-1.7.9
RUN ./configure --add-module=/work/nginx-auth-ldap/
RUN make install

WORKDIR /work

RUN wget https://raw.githubusercontent.com/calvinbui/nginx-init-ubuntu/master/nginx -O /etc/init.d/nginx

#TODO fix paths

#TODO start
