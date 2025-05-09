## Install
```
helm pull trino/trino
helm repo add trino https://trinodb.github.io/charts
helm install -f values.yaml trino trino/trino -n bigdata
helm install -f values.yaml trino ./chart -n bigdata
```
### Deploy NodePort
```
kubectl apply -f nodeport.yaml
```
## Upgrade
```
helm upgrade -f values.yaml trino trino/trino -n bigdata
helm upgrade -f values.yaml trino ./chart -n bigdata
```
## Uninstall
```
helm uninstall trino -n bigdata
```

## Kerberos
trino@HOMELDAP.ORG
./create_keytab.sh trino@HOMELDAP.ORG ldap ./files/trino.keytab

kubectl create -n bigdata secret generic keytab-trino --from-file=./files/trino.keytab

## Resources
- https://trinodb.github.io/charts/charts/trino/