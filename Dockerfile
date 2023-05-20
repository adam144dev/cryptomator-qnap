FROM openjdk:20-slim

RUN apt update && apt install -y fuse

# config directory must contain: CRYPTOMATOR_VAULT_DIRS.sh, CRYPTOMATOR_VAULTS.txt, WEBDAV_DAVE_CONFIG.yaml
ENV CONFIG_PATH '/_cryptomator/config'

# directory and subdirectories will be created as Bind Mount Host Path
ENV ENC_PATH '/_cryptomator/enc'

# Cryptomator-Cli with WebDav server: https://github.com/micromata/dave
COPY cryptomator /usr/local/bin/cryptomator
RUN mv /usr/local/bin/cryptomator/cryptomator-cli-0.5.1.jar /usr/local/bin/cryptomator/cryptomator-cli.jar

# change permission
RUN chmod +x /usr/local/bin/cryptomator/boot.sh
RUN chmod +x /usr/local/bin/cryptomator/dave

# run at startup
CMD /usr/local/bin/cryptomator/boot.sh
