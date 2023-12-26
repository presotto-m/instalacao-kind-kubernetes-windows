#Instalação chocolatey
Get-ExecutionPolicy
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Instalando kind
choco install kind

#Adicionando configuranção
echo "# three node (two workers) cluster config
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker" > kind-example-config.yaml

#Criando cluster kubernetes
kind create cluster --config kind-example-config.yaml

#Deletar cluster
kind delete cluster
