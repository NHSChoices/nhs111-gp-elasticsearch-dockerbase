#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
from java:8

ENV ES_PKG_NAME elasticsearch-1.5.0

# Install Elasticsearch.
RUN \
  cd / && \
  wget https://download.elasticsearch.org/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  tar xvzf $ES_PKG_NAME.tar.gz && \
  rm -f $ES_PKG_NAME.tar.gz && \
  mv /$ES_PKG_NAME /elasticsearch
# Define mountable directories.
#VOLUME ["/data"]

#Install Logstash
RUN wget https://download.elasticsearch.org/logstash/logstash/logstash-1.5.3.tar.gz
RUN tar zxvf logstash-1.5.3.tar.gz
RUN  cd logstash-1.5.3

#Copy config 
RUN rm -rf /elasticsearch/config/elasticsearch.yml
COPY config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

#copy gpdata
COPY config/logstash-suggery.conf /home/logstash-suggery.conf
COPY config/gpdata/ /home/gpdata/

# Mount elasticsearch.yml config
#ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

## add launcher and set execute property
add launch.sh /
run chmod +x /launch.sh


# Define default command.
cmd ["/bin/bash", "-c", "/launch.sh"]
#CMD ["/elasticsearch/bin/elasticsearch"]


# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300

#Run logstash import
#CMD ["/logstash-1.5.3/bin/logstash -f /home/logstash-suggery.conf"]
