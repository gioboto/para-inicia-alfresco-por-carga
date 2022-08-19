#!/bin/bash
#
#script verifica2.sh
# Version : 1.0
#Para parar alfresco según la carga del servidor  y vovler a iniciar alfresco una vez que la carga del sistema a bajado
#Este script es ejecutado por el script ejecutaverifica.sh
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2020-11-26

#script verifica2.sh
#Para parar alfresco según la carga del servidor  y vovler a iniciar alfresco una vez que la carga del sistema a bajado
#Este script es ejecutado por el script ejecutaverifica.sh
#


#===========================================================================
PATH=/bin:/usr/bin:/usr/sbin/
#===========================================================================
BASECARGA=5
BAJACARGA=2
MINUTOSCARGA=3
DIRECTORIO="/home/backups-root/scripts/para-inicia-alfresco-por-carga/"
ARCHIVO="/home/backups-root/scripts/para-inicia-alfresco-por-carga/.distros.txt"
SCRIPT="/home/backups-root/scripts/para-inicia-alfresco-por-carga/verifica.sh"
TEMPSCRIPT="/home/backups-root/scripts/para-inicia-alfresco-por-carga/verifica.sh.temp"
#CARGA=`uptime | awk '{print $10 * 1}' | cut -d. -f1`
CARGA=1

#if  (($CARGA > $BASECARGA)); then


#echo $CARGA>> `echo $ARCHIVO`
#LINEAS=`cat $ARCHIVO | wc -l`
#echo $LINEAS

#if  (($LINEAS > $MINUTOSCARGA)); then
#	echo $LINEAS 
#	echo " PARA alfresco"
#	mv $SCRIPT $TEMPSCRIPT
	#echo "durmiendo"
	#sleep 10
	#mv $TEMPSCRIPT $SCRIPT
#fi
#fi


#===================

if  (($CARGA < $BASECARGA)); then

head -n -1 .distros.txt > temp.txt ; mv temp.txt .distros.txt
cat .distros.txt

if [[ -f "$TEMPSCRIPT" ]]; then
    echo "$TEMPSCRIPT existe."

	if  (($CARGA < $BAJACARGA)); then
		mv $TEMPSCRIPT $SCRIPT
		echo " INICIA alfresco"
	fi
fi

fi
