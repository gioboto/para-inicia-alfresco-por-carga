#!/bin/bash
#
#script verifica.sh
# Version : 1.0
#Para parar alfresco según la carga del servidor  y vovler a iniciar alfresco una vez que la carga del sistema a bajado
#Este script es ejecutado por el script ejecutaverifica.sh
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2020-11-26

#script verifica.sh
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
CARGA=6

if  (($CARGA > $BASECARGA)); then

########inicio mensajes

        TOKEN="569774679:AAEl8uSwPNDzHwM_MCCR1-iXi4C6zLGeoqU"
        ID="152054272"
        IDPablo="839199511"
        MENSAJE="Alfresco Produccion CARGA   $HOST $CARGA                                     .";
        MERGE="$MENSAJE"
        URL="https://api.telegram.org/bot$TOKEN/sendMessage"
        curl -s -X POST $URL -d chat_id=$ID -d text="$MENSAJE"  > /dev/null
       echo $MERGE | mail -s "CARGA de Alfresco Produccion!!!"  jorge.navarrete@funcionjudicial.gob.ec
        curl -s -X POST $URL -d chat_id=$IDPablo -d text="$MENSAJE"  > /dev/null
       echo $MERGE | mail -s "CARGA de Alfresco Produccion!!!"  pablo.hidalgo@funcionjudicial.gob.ec



#########fin mensajes

echo $CARGA>> `echo $ARCHIVO`
LINEAS=`cat $ARCHIVO | wc -l`
echo $LINEAS

if  (($LINEAS > $MINUTOSCARGA)); then
	echo $LINEAS 
	echo " PARA alfresco"
	mv $SCRIPT $TEMPSCRIPT
fi
fi

