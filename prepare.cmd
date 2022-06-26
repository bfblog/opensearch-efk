
SET SCRIPT_DIR=%~dp0

kubectl.exe create configmap -n opensearch fluentd-configuration --from-file=.\config\fluent.conf --dry-run=client -o yaml  > %SCRIPT_DIR%\kubernetes\fluentd-configmap.yaml

kubectl.exe apply -f %SCRIPT_DIR%\kubernetes
kubectl.exe delete -f %SCRIPT_DIR%\kubernetes\fluentd-daemonset.yaml
kubectl.exe apply -f %SCRIPT_DIR%\kubernetes
kubectl.exe get pod -n opensearch