## Create ConfigMaps
```
kubectl create configmap hadoop-stateful-config-namenode -n bigdata --from-file=core-site.xml=./configs/core-site.xml --from-file=hdfs-site.xml=./configs/hdfs-site.xml
kubectl create configmap hadoop-stateful-config-datanode -n bigdata --from-file=core-site.xml=./configs/core-site-datanode.xml --from-file=hdfs-site.xml=./configs/hdfs-site.xml
kubectl apply -f namenode.yaml
```
## Deploy Namenode
```
kubectl apply -f namenode.yaml
```

## Deploy Datanodes
```
kubectl apply -f datanode.yaml
```