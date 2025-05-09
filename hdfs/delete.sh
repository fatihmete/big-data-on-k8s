kubectl delete -f namenode.yaml          
kubectl delete -f datanode_01.yaml
kubectl delete -f datanode_02.yaml
kubectl delete -f datanode_03.yaml
kubectl delete configmaps -n bigdata hadoop-config 
kubectl delete -n bigdata secret keytab-hdfs-namenode
kubectl delete -n bigdata secret keytab-hdfs-datanode-01
kubectl delete -n bigdata secret keytab-hdfs-datanode-02
kubectl delete -n bigdata secret keytab-hdfs-datanode-03
kubectl delete -n bigdata secret keystore-hdfs