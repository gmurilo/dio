# Desafio de Projeto

## Definição de um Cluster Swarm Local com o Vagrant

Conforme proposto pelo desafio, as alterações foram feitas no master.sh, após ele terminar de ser configurado, o script foi todo documentado, porém, seguem as informações documentadas:

- Foi instalado um servidor nfs no membro manager (10.10.10.100);

- Foi criado um volume no manager e a pasta foi utilizada como um compartilhamento nfs;

- Foi criado o script worker.sh;

- O script worker.sh fará a criação do volume app em cada worker e irá instalar o cliente nfs e fará a atribuição dele no fstab, para que seja carregado ao reinicializar o computador;

- Após fazer as configurações necessárias de armazenamento, o script irá subir um container utilizando a imagem httpd porém deixará como porta de serviço http a porta 888 (888:80), será limitado a apenas 1 réplica por host (no caso 4), o nome do container será web_server.