#!/usr/bin/sh

# !!! RUN FROM DOCKERFILE !!!

export DEBIAN_FRONTEND=noninteractive

apt-get install -y curl maven bash-completion jq

echo "installing yq ..."
curl -o /tmp/yq_linux_amd64.tar.gz -LO https://github.com/mikefarah/yq/releases/download/v4.24.5/yq_linux_amd64.tar.gz 
tar xzvf /tmp/yq_linux_amd64.tar.gz  -C /usr/bin ./yq_linux_amd64
mv /usr/bin/yq_linux_amd64 /usr/bin/yq
chown 0 /usr/bin/yq
chgrp 0 /usr/bin/yq
chmod +x /usr/bin/yq
rm /tmp/yq_linux_amd64.tar.gz

echo "install kubectl ..."
apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubectl

echo "install docker ..."
apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update

apt-get install -y docker-ce docker-ce-cli containerd.io

echo "cleaning cache ..."
apt-get clean

kubectl completion bash >> /completion.sh
