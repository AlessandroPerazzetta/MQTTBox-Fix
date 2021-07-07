#!/bin/bash
MQTTBOX_PATH=$(dirname $(realpath $(which MQTTBox)))"/"

if ! [ -x "$(command -v MQTTBox)" ]; then
	echo "Error: MQTTBox is not installed." >&2
	exit 1
else
    echo "MQTTBox is in $MQTTBOX_PATH"
fi

read -p "Continue (y/n)?" choice
case "$choice" in 
  y|Y ) echo "Starting ...";;
  n|N ) echo "Bye!" && exit 1;;
  * ) echo "Yes or No please, nothing else matters" && exit 1;;
esac

echo "Backup original MQTTBox directory"
sudo tar -cpzf MQTTBOX-backup.tar.gz $MQTTBOX_PATH 2> /dev/null

echo "Creating download temporary path in /tmp/mqttbox-patch ..."
cd /tmp/
mkdir -p mqttbox-patch
cd mqttbox-patch

echo "Downloading libraries from http://security.ubuntu.com/ubuntu/pool/main/"
curl -sO http://security.ubuntu.com/ubuntu/pool/main/p/pango1.0/libpango-1.0-0_1.40.14-1ubuntu0.1_amd64.deb
curl -sO http://security.ubuntu.com/ubuntu/pool/main/p/pango1.0/libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64.deb
curl -sO http://security.ubuntu.com/ubuntu/pool/main/p/pango1.0/libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64.deb

echo "Creating directory for .deb extraction"
mkdir -p libpango-1.0-0_1.40.14-1ubuntu0.1_amd64
mkdir -p libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64
mkdir -p libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64

echo "Extracting libraries ..."
ar x libpango-1.0-0_1.40.14-1ubuntu0.1_amd64.deb --output libpango-1.0-0_1.40.14-1ubuntu0.1_amd64
ar x libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64.deb --output libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64
ar x libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64.deb --output libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64

echo "Copying libpango libraries to $MQTTBOX_PATH"
cd libpango-1.0-0_1.40.14-1ubuntu0.1_amd64
tar -xf data.tar.xz 
sudo cp usr/lib/x86_64-linux-gnu/* $MQTTBOX_PATH
cd ..

echo "Copying libpangocairo libraries to $MQTTBOX_PATH"
cd libpangocairo-1.0-0_1.40.14-1ubuntu0.1_amd64
tar -xf data.tar.xz 
sudo cp usr/lib/x86_64-linux-gnu/* $MQTTBOX_PATH
cd ..

echo "Copying libpangoft2 libraries to $MQTTBOX_PATH"
cd libpangoft2-1.0-0_1.40.14-1ubuntu0.1_amd64
tar -xf data.tar.xz 
sudo cp usr/lib/x86_64-linux-gnu/* $MQTTBOX_PATH
cd ..

