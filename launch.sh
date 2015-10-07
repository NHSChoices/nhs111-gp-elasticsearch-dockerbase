#!/bin/bash
echo "DEBUG"

#Start elasticSearch
/elasticsearch/bin/elasticsearch -d

#Run logstash import
/logstash-1.5.3/bin/logstash -f /home/logstash-suggery.conf

