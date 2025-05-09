helm uninstall trino -n bigdata
helm install -f values.yaml trino ./chart -n bigdata