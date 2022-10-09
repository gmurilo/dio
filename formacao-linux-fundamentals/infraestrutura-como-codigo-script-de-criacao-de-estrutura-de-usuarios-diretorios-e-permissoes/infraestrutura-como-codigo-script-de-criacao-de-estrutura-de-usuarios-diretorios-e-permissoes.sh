#!/bin/bash
# Script desenvolvido para o Cloud DevOps Experience - Banco Carrefour
# Descrição de variáveis
# DELAY: tempo de pausa para ler informações
# ROOT: diretório inicial para o programa
# DIRETORIOS: diretórios que o programa irá criar
# GRUPOS: grupos de usuários que serão criados
# INITIAL_PWD: hash para geração de senha
# USERS: usuários que serão criados
# UG: associação de grupos à usuários, cada grupo será colocado no formado [groups|users] onde
#     groups = nome dos grupos, podendo o mesmo ser separado por vírgulas, exemplo [group1:group2|users]
#     users = nome dos usuários, os usuários serão atribuidos à todos os grupos cadastrados
#             Ex1: [group1|user1:user2:user3]
#             Ex2: [group1:group2|user1:user2:user3]
#             Ex3: [group1|user1]
DELAY=1
ROOT="/root_dir"
DIRETORIOS="publico,admX,ven,sec"
GRUPOS="publico,admX,ven,sec"
INITIAL_PWD="HASH_PWD"
USERS="user1,user2,user3,user4,user5,user6,user7,user8"
UG="[publico|user1:user2],[admX|user3:user4],[ven|user5:user6],[sec|user7:user8]"
echo "Desenvolvido para o Cloud DevOps Experience - Banco Carrefour"
echo "============================================================="
read -t ${DELAY} -p "verificando o diretório root [${ROOT}] ..."
if [ -d ${ROOT} ];
then
  echo " [OK]"
else
  echo " [NÃO ENCONTRADO]"
  read -p "Diretório não encontrado, deseja criar ? (y/N)" criar
  if [ "${criar}" == "y" ];
  then
    mkdir -p ${ROOT}
    echo "Diretório ${ROOT} criado."
  else
    echo "Script finalizado com erro."
    echo "============================================================="
    exit 0
  fi;
fi;

# Iniciando criação de estrutura de diretorios
read -t ${DELAY} -p "Criando diretórios em [${ROOT}]"
echo ""
for dir in ${DIRETORIOS//,/ }
do
  dir="${ROOT}/${dir}"
  if [ ! -d "${dir}" ];
  then
    echo -e "Criando diretório ${dir} ..."
    mkdir -p "${dir}"
    if [ -d "${dir}" ];
    then
      echo " [OK]"
    else
      echo " [ERROR]"
      echo "Script finalizado com erro."
      echo "============================================================="
      exit 0
     fi;
  else
    echo "Diretório ${dir} já existe, pulando."
  fi;
done;

# Iniciando criação de grupos
read -t ${DELAY} -p "Criando grupos de usuários"
echo ""
for grp in ${GRUPOS//,/ }
do
  dir="${ROOT}/${grp}"
  if [ ! $(getent group ${grp}) ];
  then
    echo "Criando grupo [${grp}]"
    groupadd ${grp}
    chown root:${grp} -R ${dir}
    echo "Grupo ${grp} criado e permissão definida"
  else
    echo "Grupo [${grp}] já existe"
    chown root:${grp} -R ${dir}
   fi;
done;

# Iniciando criação de usuários
read -t ${DELAY} -p "Criando usuários"
echo ""
for usr in ${USERS//,/ }
do
  if [ ! $(getent passwd ${usr}) ];
  then
    echo "Criando usuario [${usr}]"
    cryptedpass=$(openssl passwd -crypt ${INITIAL_PWD})
    useradd ${usr} -m -N -s /bin/bash -p ${cryptedpass}
    if [ $(getent passwd ${usr}) ];
    then
      echo "Usuário [${usr}] criado com a senha [${cryptedpass}]"
    fi;
  else
    echo "Usuário [${usr}] já existe"
  fi;
done;

# Definindo permissões dos usuários
for perms in ${UG//,/ }
do
  echo "Criando permissoes ${perms}"
  groups=$(echo ${perms:1} | cut -f 1 -d '|')
  users=$(echo ${perms:1:-1} | cut -f 2 -d '|')
  for group in ${groups//:/ }
  do
    for user in ${users//:/ }
    do
      echo "Adicionando usuários [${user}] ao grupo [${group}]"
      usermod -a -G ${group} ${user}
    done;
  done;
done;
echo "============================================================="
exit 1