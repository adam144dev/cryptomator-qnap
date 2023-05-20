#!/bin/bash

# prepare mount points
# CRYPTOMATOR_INTERNAL_MOUNT_PATH should be used in CRYPTOMATOR_VAULT_DIRS.sh
export CRYPTOMATOR_INTERNAL_MOUNT_PATH='/_cryptomator/mount'

# from now work in bin/cryptomator
cd /usr/local/bin/cryptomator

# directory CRYPTOMATOR_INTERNAL_MOUNT_PATH and subdirectories will be created by CRYPTOMATOR_VAULT_DIRS.sh
cp ${CONFIG_PATH}/CRYPTOMATOR_VAULT_DIRS.sh ./CRYPTOMATOR_VAULT_DIRS.sh
chmod +x ./CRYPTOMATOR_VAULT_DIRS.sh
./CRYPTOMATOR_VAULT_DIRS.sh

# prepare cryptomator_boot.sh
cat ./cryptomator_0.sh ${CONFIG_PATH}/CRYPTOMATOR_VAULTS.txt > ./cryptomator_boot.sh
chmod +x ./cryptomator_boot.sh
# run cryptomator
./cryptomator_boot.sh &

# dave WebDav
cp ${CONFIG_PATH}/WEBDAV_DAVE_CONFIG.yaml ./config.yaml
./dave
