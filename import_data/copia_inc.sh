#!/bin/bash
DATE=$(date +%Y-%m-%d-%H%M%S) #Asignamos la fecha a una variable
DESTINO="/home/usuari/segur_inc_mysql"
ORIGEN="/var/lib/mysql"
NOM_BACKUP="backup_$DATE"

#Executem el rsync
rsync -av --link-dest=$DESTINO $ORIGEN $DESTINO/$NOM_BACKUP

