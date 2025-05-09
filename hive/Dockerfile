FROM apache/hive:4.0.1

COPY files/postgres.jar /opt/hive/lib/postgres.jar
# Mysql: COPY files/mysql.jar /opt/hive/lib/mysql.jar

USER root

RUN apt-get update && \
DEBIAN_FRONTEND=noninteractive apt-get -qq -y install krb5-config krb5-user

RUN mkdir -p /home/hive
RUN chown -R hive:hive /home/hive

RUN mkdir /ranger
RUN chown hive:hive /ranger
USER hive
COPY files/ranger-3.0.0-SNAPSHOT-hive-plugin.tar.gz /ranger/ranger-3.0.0-SNAPSHOT-hive-plugin.tar.gz
WORKDIR /ranger

RUN tar -xvf /ranger/ranger-3.0.0-SNAPSHOT-hive-plugin.tar.gz
RUN chmod +x /ranger/ranger-3.0.0-SNAPSHOT-hive-plugin/enable-hive-plugin.sh

RUN mkdir -p /var/log/hive/audit/solr/spool
RUN chown -R hive:root /var/log/hive/audit/solr/spool
WORKDIR /opt/hive

USER root