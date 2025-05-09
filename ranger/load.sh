kubectl delete -f ranger.yaml --force
kubectl delete configmaps -n bigdata ranger-config
kubectl delete -n bigdata secret keytab-ranger
kubectl delete configmap ranger-log4j -n bigdata 
kubectl create configmap ranger-config -n bigdata --from-file=ranger-admin-install.properties=./configs/ranger-admin-install.properties --from-file=log4j.xml=./configs/log4j.xml
kubectl create -n bigdata secret generic keytab-ranger --from-file=spnego.keytab=./files/spnego.keytab --from-file=rangeradmin.keytab=./files/rangeradmin.keytab --from-file=rangerlookup.keytab=./files/rangerlookup.keytab
kubectl apply -f ranger.yaml


