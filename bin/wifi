#!/bin/sh

DEVICE="wlan0"
FONT="JetBrainsMono-16"
NB="#0E203A"
NF="#BDBCB5"
SB="#1E3657"
SF="#FEEACF"
FLAGS=" -l 10 -fn $FONT -nb $NB -nf $NF -sb $SB -sf $SF"


connect() {
	
	SSID="$1"
	
	if [ -z "$var" ]; then
		exit 0
	fi

	if iwctl station "$DEVICE" connect "$SSID" --dont-ask; then
		exit 0
	fi

	iwctl station "$DEVICE" connect "$SSID" \
		--passphrase="$(dmenu $FLAGS -p Password: </dev/null)"

}

disconnect() {
	
	SSID="$1"

	iwctl station $DEVICE disconnect "$SSID"

}

iwctl station "$DEVICE" scan
#SELECTION=$(iwctl station "$DEVICE" get-networks rssi-dbms | tail -n +5 | sed '1 s/^....//'| tr -s ' ' | sort -k2 -n -r | awk '{print $1}' | dmenu -l 10 -fn $FONT)
SELECTION=$(iwctl station "$DEVICE" get-networks rssi-dbms | tail -n +5 | sed '1 s/^....//'| sed 's/.........>...../>/' | sed '/>/! s/^/-/' | tr -s ' ' | sort -k4 -n -r | grep -vx -- '-' | dmenu $FLAGS)

FIRST_CHAR="${SELECTION%"${SELECTION#?}"}"

SSID=$(echo "$SELECTION" | awk '{print $2}')

if [ "$FIRST_CHAR" = ">" ]; then
	disconnect "$SSID"
else
	connect "$SSID"
fi

