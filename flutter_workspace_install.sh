#!/bin/bash

echo "## Iniciando Instalação Ambiente Flutter ##";

cd $HOME

echo "Criando a pasta development"
mkdir development
cd $HOME/development/

echo "Informe a versão a ser instalada do flutter"
echo "Caso não seja informado, instalará a versão 2.5.1"
read -p "Versão: " version

if [ -z "$version"]; then
    version="2.5.1"
fi

echo "Baixando e descompactando flutter #$version"
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_$version-stable.tar.xz
tar xf flutter_linux_$version-stable.tar.xz

echo "Exportando path"
export PATH=$HOME/development/flutter/bin:$PATH

echo "Atualizando Bash"
source ~/.bashrc

sudo apt-get install lib32stdc++6

cd $HOME/development/

echo "Iniciando instalação do Android Studio"

echo "Aguarde a abertura do Android Studio e efetue a instalação (Next-Next-Finish)"
echo "Após instalado o Android Studio e aberto, acesse More Actions > SDK Manager > SDK Tools > Marque Android SDK Command-Line-Tools"
echo ""
read -p "Pressione Enter para iniciar a instalação..." enter

wget https://redirector.gvt1.com/edgedl/android/studio/ide-zips/2021.2.1.14/android-studio-2021.2.1.14-linux.tar.gz
tar xf android-studio-2021.2.1.14-linux.tar.gz

cd $HOME/development/android-studio/bin

./studio.sh

echo "Executando flutter doctor"
flutter doctor --android-licenses

#Precisou para identificar o flutter doctor depois da instalação
export PATH=$HOME/development/flutter/bin:$PATH

echo "Fim da instalação"