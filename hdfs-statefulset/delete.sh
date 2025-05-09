kubectl delete -f namenode.yaml          
kubectl delete -f datanode.yaml
kubectl delete configmaps -n bigdata hadoop-stateful-config-namenode
kubectl delete configmaps -n bigdata hadoop-stateful-config-datanode