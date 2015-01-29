#!/bin/bash

# configure script for nginx
# must be run with path to nginx src as parameter.
#   example: nginx.configure.sh /path/to/nginx-1.7.9/

# use nginx directory as base, since required by configure script
echo running nginx configure with base path: $1
cd $1

./configure --add-module=/work/nginx-auth-ldap/
