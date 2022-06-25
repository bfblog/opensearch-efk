
kubectl.exe create configmap -n opensearch fluentd-configuration --from-file=.\config\fluent.conf --dry-run=client -o yaml  > .\kubernetes\fluentd-configmap.yaml
