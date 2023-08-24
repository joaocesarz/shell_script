#!/usr/bin/env bash

##############################################################################
#                                                                            #
# GeraBackup.sh - Shell Script 					     
#                                                                            #
# Autor: João Vitor César Batista <mercadinhodoleo95@gmail.com>		         #
# Data de Criação: 03 jul 2023 - 15:03
#									                                         #
# Descrição: Descrição feita pelo usuário, do que se trata o script          #
#            ...                                                             #
#									                                         #
# Exemplo de uso: ./GeraBackup.sh
#									                                         #
# Alterações:								                                 #
#       DIA # - Atualizações feitas no script                                #
#       DIA # - ...                                                          #
#									                                         #
##############################################################################

DIRDEST=$HOME/Backup

if [ ! -d DIRDEST ] 
then
		echo "Criando Diretório $DIRDEST..."
		mkdir -p $DIRDEST
fi

DAYS7=$(find $DIRDEST -ctime -7 -name Backup_home\*tgz)

if ['DAYS7']  # Testa se a variável e nula. atenção nas aspas duplas
then
		echo "Já foi gerado um backup do diretório $HOME nos últimos 7 dias. "
		echo -n "Deseja continuar? (N/s): "
		read -n1 CONT
		echo
		if ["$CONT" = N -o "$CONT" = n -o "$CONT" = "" ]
		then
				echo "Backup Abortado!"
				exit 1
		elif [ "$CONT" = S -o "$CONT" = s ]
		then
				echo "Será criado mais um Backup para a mesma semana"
		else
				echo "Opção inválida"
				exit 2
		fi
fi

echo "Criando Backup..."

ARQ="Backup_home_$(date +%Y%m%d%H%M).tgz"
tar zcvpf $DIRDEST/$ARQ  --exclude="$DIRDEST" "$HOME"/* > /dev/null

echo
echo "O backup de nome \""$ARQ"\" foi criado em $DIRDEST"
echo
echo "Backup Concluído!"
echo
		

