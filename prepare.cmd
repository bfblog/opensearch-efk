
kubectl.exe create configmap -n opensearch fluentd-configuration --from-file=.\config --dry-run=client -o yaml  > .\kubernetes\fluentd-configmap.yaml
