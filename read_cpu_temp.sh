#!/bin/bash

# Vérification de la présence de la commande bc
if ! command -v bc >/dev/null 2>&1; then
  echo "bc n'est pas installé. Installation de bc..."
  sudo apt-get update
  sudo apt-get install bc -y
fi

# Récupération de la température du CPU
temp=$(cat /sys/class/thermal/thermal_zone0/temp)

# Conversion de la température de milli-degrés Celsius en degrés Celsius
temp=$(echo "scale=2; $temp/1000" | bc)

# Affichage de la température du CPU
echo "La température du CPU est de $temp°C."
