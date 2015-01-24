#!/bin/bash

#start nginx
service nginx start

#start elasticsearch
elasticsearch-1.4.2/bin/elasticsearch > /var/log/elasticsearch.log &

#start logstash
logstash-1.4.2/bin/logstash -f logstash-1.4.2/logstash.conf > /var/log/logstash.log
