#!/bin/bash

# configure script for nginx
# must be run with path to nginx src as parameter.
#   example: nginx.configure.sh /path/to/nginx-1.7.9/

# use nginx directory as base, since required by configure script
echo running nginx configure with base path: $1
cd $1

./configure \
    --user=nginx \
    --group=nginx \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --conf-path=/etc/nginx/nginx.conf \
    --pid-path=/run/nginx.pid \
    --sbin-path=/usr/sbin/nginx \
    --with-debug \
    --with-http_ssl_module \
    --with-pcre=/work/pcre-8.35 \
    --with-zlib=/work/zlib-1.2.8 \
    --with-openssl=/work/openssl-1.0.2 \
    --with-http_spdy_module \
    --add-module=/work/nginx-auth-ldap/

make install
