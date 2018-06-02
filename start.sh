#!/bin/bash

function greenMessage() {
  echo -e "\\033[32;1m${*}\\033[0m"
}

function magentaMessage() {
  echo -e "\\033[35;1m${*}\\033[0m"
}

function cyanMessage() {
  echo -e "\\033[36;1m${*}\\033[0m"
}

function redMessage() {
  echo -e "\\033[31;1m${*}\\033[0m"
}

function yellowMessage() {
  echo -e "\\033[33;1m${*}\\033[0m"
}


if [ "$1" = "start" ];
then
        screen -dmS ANTI-PROXYTS bash lunchbot.sh -i 1

        greenMessage '[Robot.service] Démarrer avec succès !'

elif [ "$1" = "stop" ];
then
		pkill -f ANTI-PROXYTS

        redMessage '[Robot.service] Arrêter avec succès !'
elif [ "$1" = "status" ];
then

    greenMessage '────────────────────────'
    if ! screen -list | grep -q "ANTI-PROXYTS"; then
        greenMessage '[Robot.service] Actuellement déactivé !'
    else
        greenMessage '[Robot.service] Actuellement activé !'
    fi

    greenMessage '────────────────────────'

else
	greenMessage 'Utilisation : ./start.sh <start|stop|status>'
fi
