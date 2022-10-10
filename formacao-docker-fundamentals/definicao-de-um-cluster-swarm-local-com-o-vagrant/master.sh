#!/bin/bash
sudo docker swarm init --advertise-addr=10.10.10.100
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh
# Desafio
## Subindo no servidor o nfs-server
sudo apt install nfs-server -y
## Criando o volume
sudo docker volume create app
## Configurando os exports "acesso para o nfs-server"
sudo echo "/var/lib/docker/volumes/app/_data *(rw,sync,subtree_check)" >> /etc/exports
## Exporta as novas configurações de acesso do nfs-server
sudo exportfs -ar
## Cria o volume para os workers
sudo echo "sudo docker volume create app" >> /vagrant/worker.sh
## Instala o cliente nfs (nfs-common)
sudo echo "sudo apt install nfs-common -y" >> /vagrant/worker.sh
## Configura o diretorio como um ponto de montagem do servidor nfs
sudo echo "sudo echo 10.10.10.100:/var/lib/docker/volumes/app/_data /var/lib/docker/volumes/app/_data  nfs rw 0 0 >> /etc/fstab" >> /vagrant/worker.sh
## Monta todos os compartilhamentos
sudo echo "mount -a" >> /vagrant/worker.sh
## Sobe 4 instâncias do httpd usando o volume app, redirecionando a porta 888 para 80 com a imagem httpd
sudo docker service create --name web_server --replicas 4 -dt -p 888:80 --mount type=volume,src=app,dst=/usr/local/apache2/htdocs httpd
