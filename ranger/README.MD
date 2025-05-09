## Install
Ranger requires solr and database (postgresql)

## Kerberos
HTTP/ranger.company.bigdata.svc.cluster.local@HOMELDAP.ORG
rangeradmin/ranger.company.bigdata.svc.cluster.local@HOMELDAP.ORG
rangerlookup/ranger.company.bigdata.svc.cluster.local@HOMELDAP.ORG



## Building Images and Plugins

```sh
git clone https://github.com/apache/ranger.git
cd ranger
```
hive-agent/src/main/java/org/apache/ranger/authorization/hive/authorizer/RangerHiveAuthorizer.java

```bash
export ENABLED_RANGER_SERVICES="tagsync,hadoop,hbase,kafka,hive,knox,kms"
 ./ranger_in_docker up
```
 docker-compose -f docker-compose.ranger-base.yml -f docker-compose.ranger-build.yml up
/home/ranger/scripts/ranger-admin-install.properties
## Resources
- https://registry.hub.docker.com/r/apache/ranger
- https://cwiki.apache.org/confluence/pages/viewpage.action?pageId=235837576
- https://ranger.apache.org/quick_start_guide.html
- https://github.com/mannharleen/apache-ranger-aws-emr/blob/master/install-hive-hdfs-ranger-plugin-EMR.sh