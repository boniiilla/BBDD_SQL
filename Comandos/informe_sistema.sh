#!/bin/bash

DESTINO="informacion_sistema_$(date +'%Y%m%d')"
mkdir "$DESTINO"

lscpu > "$DESTINO/cpu_info.txt"
lsusb -v -t > "$DESTINO/usb_info.txt"
ip a > "$DESTINO/ethernet_info.txt"
free -h > "$DESTINO/memoria_info.txt"
df -h > "$DESTINO/espacio_discos.txt"
ps aux > "$DESTINO/procesos.txt"
sudo fdisk -l > "$DESTINO/discos_info.txt"
uname -a > "$DESTINO/kernel_info.txt"
lspci > "$DESTINO/lspci_info.txt"

echo "La información ha sido guardada en la siguiente carpeta:"
echo $DESTINO
