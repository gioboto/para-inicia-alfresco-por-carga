#!/bin/bash
#
#script ejecutaverifica.sh
# Version : 1.0
#Para parar alfresco según la carga del servidor  y vovler a iniciar alfresco una vez que la carga del sistema a bajado
#Este script es el script base,  que usa scripts verifica.sh y verifica2.sh, se usa un cron para validar de forma recurente los servicios. Script ejecutaverifica.sh cambiara el nobmre de verifica.sh a verifica.sh.temp según las condiciones   
#Autor : Ing. Jorge Navarrete
#mail : jorge_n@web.de
#Fecha : 2020-11-26

#script ejecutaverifica.sh
#Para parar alfresco según la carga del servidor  y vovler a iniciar alfresco una vez que la carga del sistema a bajado
#Este script es el script base,  que usa scripts verifica.sh y verifica2.sh, se usa un cron para validar de forma recurente los servicios. Script ejecutaverifica.sh cambiara el nobmre de verifica.sh a verifica.sh.temp según las condicione

#
#===========================================================================
PATH=/bin:/usr/bin:/usr/sbin/
#===========================================================================
BASECARGA=5
BAJACARGA=2
MINUTOSCARGA=3
DIRECTORIO="/root/temp/"
ARCHIVO="/root/temp/.distros.txt"
TEMPARCHIVO="/root/temp/verifica.txt"
TTEMPARCHIVO="/root/temp/verifica.txt.temp"
SCRIPT="/home/backups-root/scripts/para-inicia-alfresco-por-carga/verifica.sh"
TEMPSCRIPT="/home/backups-root/scripts/para-inicia-alfresco-por-carga/verifica.sh.temp"
#CARGA=`uptime | awk '{print $10 * 1}' | cut -d. -f1`
#CARGA=1

if [[ -f "$SCRIPT" ]]; then
    echo "$SCRIPT existe."
	#uuCARGA=`/root/temp/verifica.sh`
	/home/backups-root/scripts/para-inicia-alfresco-por-carga/verifica.sh
fi

