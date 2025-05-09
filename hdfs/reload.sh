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
kubectl create configmap hadoop-config -n bigdata --from-file=core-site.xml=./configs/core-site.xml --from-file=hdfs-site.xml=./configs/hdfs-site.xml --from-file=ssl-server.xml=./configs/ssl-server.xml
kubectl create -n bigdata secret generic keytab-hdfs-namenode --from-file=./files/namenode.keytab
kubectl create -n bigdata secret generic keytab-hdfs-datanode-01 --from-file=datanode.keytab=./files/datanode01.keytab
kubectl create -n bigdata secret generic keytab-hdfs-datanode-02 --from-file=datanode.keytab=./files/datanode02.keytab
kubectl create -n bigdata secret generic keytab-hdfs-datanode-03 --from-file=datanode.keytab=./files/datanode03.keytab
kubectl create -n bigdata secret generic keystore-hdfs --from-file=keystore=./files/keystore --from-file=truststore=./files/truststore
kubectl apply -f namenode.yaml
kubectl apply -f datanode_01.yaml
kubectl apply -f datanode_02.yaml
kubectl apply -f datanode_03.yaml
