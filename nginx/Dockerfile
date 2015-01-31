FROM ubuntu:14.04


# install prerequisites
RUN apt-get update && apt-get install wget git-core build-essential libldap2-dev libssl-dev libpcre3-dev -y

WORKDIR /work

# download needed sources
RUN wget http://nginx.org/download/nginx-1.7.9.tar.gz && tar -xzf nginx-1.7.9.tar.gz && rm nginx-1.7.9.tar.gz
RUN wget http://zlib.net/zlib-1.2.8.tar.gz && tar -xzf zlib-1.2.8.tar.gz && rm zlib-1.2.8.tar.gz
RUN wget ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.35.tar.gz && tar -xzf pcre-8.35.tar.gz && rm pcre-8.35.tar.gz
RUN wget https://www.openssl.org/source/openssl-1.0.2.tar.gz && tar -xzf openssl-1.0.2.tar.gz && rm openssl-1.0.2.tar.gz
RUN git clone https://github.com/kvspb/nginx-auth-ldap.git

# configure and install nginx
ADD nginx.build.sh /work/
RUN useradd -M -U -s /usr/sbin/nologin nginx
RUN ./nginx.build.sh /work/nginx-1.7.9/
RUN mkdir /etc/nginx/sites-available /etc/nginx/sites-enabled
ADD nginx.conf /etc/nginx/
ADD default /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

# add init script
ADD nginx.init /etc/init.d/nginx

# expose default ports
EXPOSE 80
EXPOSE 443

#TODO start
