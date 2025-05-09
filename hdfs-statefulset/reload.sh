kubectl delete -f namenode.yaml          
kubectl delete -f datanode.yaml
kubectl delete configmaps -n bigdata hadoop-stateful-config-namenode
kubectl delete configmaps -n bigdata hadoop-stateful-config-datanode
kubectl create configmap hadoop-stateful-config-namenode -n bigdata --from-file=core-site.xml=./configs/core-site.xml --from-file=hdfs-site.xml=./configs/hdfs-site.xml
kubectl create configmap hadoop-stateful-config-datanode -n bigdata --from-file=core-site.xml=./configs/core-site-datanode.xml --from-file=hdfs-site.xml=./configs/hdfs-site.xml
kubectl apply -f namenode.yaml
kubectl apply -f datanode.yaml
