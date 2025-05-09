kubectl delete -f solr.yaml
kubectl delete configmaps -n bigdata solr-config
kubectl create configmap solr-config -n bigdata --from-file=solrconfig.xml=./ranger_configs/solrconfig.xml --from-file=managed-schema=./ranger_configs/managed-schema
kubectl apply -f solr.yaml
