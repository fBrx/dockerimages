#!/bin/bash

#remove possibly existing site
rm -rf /site/public/*

#run hugo with the suplplied arguments
echo running: hugo "$@"
exec hugo "$@"
