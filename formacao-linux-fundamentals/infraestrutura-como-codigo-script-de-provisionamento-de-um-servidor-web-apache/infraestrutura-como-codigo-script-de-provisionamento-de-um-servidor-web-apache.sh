# Descrição de variáveis
# DELAY: tempo de pausa para ler informações
# DISTRO: distribuição línux à ser utilzada
# Descrição de funções
# packages: instala pacotes necessários de acordo com a distro
# downloadpkg: baixa o pkg "zip" e descompacta
DISTRO="ubuntu"
DEFAULT_DIR="/var/www/html/pkg"
PKG_LINK="http://teste/pkg.zip"
PKG_NAME="pkg.zip"
echo "Desenvolvido para o Cloud DevOps Experience - Banco Carrefour"
echo "============================================================="
#Instala pacotes

packages() {
  case ${DISTRO} in
    "centos")
      #install apache
      #install unzip
      #install wget
      yum install -y httpd unzip wget
      ;;
    "ubuntu")
      #install apache2
      #install unzip
      #install wget
      apt-get install -y apache2 unzip wget
      ;;
  esac
}
downloadpkg() {
  echo "baixando pacote do instalador"
  if [ ! -d "${DEFAULT_DIR}" ];
  then
    mkdir -p "${DEFAULT_DIR}"
  fi;
  cd "${DEFAULT_DIR}"
  wget -O "${PKG_NAME}" "${PKG_LINK}"
  unzip "${PKG_NAME}"
}
packages
downloadpkg

