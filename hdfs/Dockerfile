FROM apache/hadoop:3.4.1

USER root
RUN mkdir /ranger
RUN chown hadoop:hadoop /ranger
RUN mkdir -p /etc/ranger
RUN chown -R hadoop:root /etc/ranger
RUN mkdir -p /var/log/hadoop/hdfs/audit/solr/spool
RUN chown -R hadoop:root /var/log/hadoop/hdfs/audit/solr/spool
USER hadoop
COPY files/ranger-3.0.0-SNAPSHOT-hdfs-plugin.tar.gz /ranger/ranger-3.0.0-SNAPSHOT-hdfs-plugin.tar.gz
WORKDIR /ranger
RUN tar -xvf /ranger/ranger-3.0.0-SNAPSHOT-hdfs-plugin.tar.gz
RUN chmod +x /ranger/ranger-3.0.0-SNAPSHOT-hdfs-plugin/enable-hdfs-plugin.sh

WORKDIR /opt/hadoop
USER root
