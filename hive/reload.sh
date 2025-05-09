kubectl delete -f metastore.yaml --force
kubectl delete -f hiveserver.yaml --force
kubectl delete configmaps -n bigdata hive-site-config
kubectl delete secret -n bigdata keytab-hive
kubectl delete secret -n bigdata keytab-hive-server
kubectl create -n bigdata secret generic keytab-hive --from-file=./files/hive.keytab
kubectl create -n bigdata secret generic keytab-hive-server --from-file=./files/hiveserver.keytab
kubectl create configmap hive-site-config -n bigdata --from-file=hive-site.xml=./configs/hive-site.xml --from-file=log4j.properties=./configs/log4j2.properties --from-file=yarn-site.xml=./configs/yarn-site.xml 
kubectl apply -f metastore.yaml
kubectl apply -f hiveserver.yaml
