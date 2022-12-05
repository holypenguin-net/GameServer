#!/bin/bash
# Prepare Variables
if [[ -z $TER_VERSION ]]; then
    echo "No TER_VERSION set.\nSetting default Version."
    TER_VERSION=1.4.4.9
fi

TER_VERSION_SHORT=$(echo $TER_VERSION | sed -r 's/\.//g')
if ! [[ $TER_VERSION_SHORT =~ ^[0-9]*$ ]]; then
    echo "Wrong TER_VERSION!"
    exit 1;
fi

TER_SERVER_URL=https://terraria.org/api/download/pc-dedicated-server/terraria-server-$TER_VERSION_SHORT.zip

# Downloading Server
echo "Downloading server..."
curl -o server.zip -f $TER_SERVER_URL
if [[ $? -eq 0 ]]; then
    echo "Download finished!"
else
    echo "Server with version \"$TER_VERSION\" does not exist!"
fi

# Unzip folder
echo "Unzipping server."
unzip server.zip
mv $TER_VERSION_SHORT/Linux data
rm -r $TER_VERSION_SHORT server.zip
