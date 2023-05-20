#!/bin/bash

CRYPTOMATOR_PORT_NOT_USED=65000

java -jar /usr/local/bin/cryptomator/cryptomator-cli.jar \
    --bind 0.0.0.0 --port ${CRYPTOMATOR_PORT_NOT_USED} \
