#!/bin/bash

# Verifica se um novo hostname foi fornecido
if [ -z "$1" ]; then
  echo "Uso: $0 <novo_hostname>"
  exit 1
fi

echo "Lembre-se que o nome da rede e a senha serão alterados para o mesmo nome do hostname."
echo "Após a finalização o serviço de rede será reiniciado."

#Atribuindo as variáveis segundo o novo nome do hostname que será o mesmo da rede e a senha.
NEW_HOSTNAME=$1

ARQUIVO=enableHotSpot.sh
TEXTO_ANTIGO="Nome_Rede"
NOVO_TEXTO=$NEW_HOSTNAME

# Alterando o hostname atual
echo "Alterando o hostname para $NEW_HOSTNAME..."

# Atualiza o arquivo /etc/hostname
echo $NEW_HOSTNAME | sudo tee /etc/hostname

# Atualiza o arquivo /etc/hosts
sudo sed -i "s/$(hostname)/$NEW_HOSTNAME/g" /etc/hosts

# Altera o hostname para a sessão atual
sudo hostnamectl set-hostname $NEW_HOSTNAME

echo "Hostname alterado para $NEW_HOSTNAME com sucesso!"

# Verifica se o arquivo existe
if [ ! -f "$ARQUIVO" ]; then
  echo "Erro: O arquivo '$ARQUIVO' não existe."
  exit 1

fi

# Substitui o texto antigo pelo novo
sudo sed -i "s/$TEXTO_ANTIGO/$NOVO_TEXTO/g" "$ARQUIVO"

echo "Criando hotspot..."
sudo cp enableHotSpot.sh /usr/bin/
sudo cp enableHotSpot.service /etc/systemd/system/


echo "Substituição concluída: '$TEXTO_ANTIGO' foi substituído por '$NOVO_TEXTO' em $ARQUIVO."

sudo systemctl stop enableHotSpot.service
sudo systemctl start enableHotSpot.service
sudo systemctl enable enableHotSpot.service

Echo "Se tudo deu certo, sua rede agora se chama $NEW_HOSTNAME ! ;-)"
