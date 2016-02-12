#!/bin/sh

KEY_FILE=/etc/letsencrypt/live/$LE_DOMAIN/fullchain.pem

if [ ! -e "$KEY_FILE" ]; then 
	echo "no certificate found for domain $LE_DOMAIN in location $KEY_FILE...starting letsencrypt client"
	/opt/letsencrypt/letsencrypt-auto certonly -m $LE_MAIL -d $LE_DOMAIN --agree-tos $LE_CLI $LE_ARGS
fi

echo "starting nginx"
nginx -g "daemon off;"