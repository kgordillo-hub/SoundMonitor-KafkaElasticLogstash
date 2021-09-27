FROM docker.elastic.co/logstash/logstash:7.10.2
RUN rm -f /usr/share/logstash/pipeline/logstash.conf
ADD pipeline/ /usr/share/logstash/pipeline/
ENV xpack.monitoring.enabled=false
CMD bin/logstash
