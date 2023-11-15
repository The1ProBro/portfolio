#!/bin/bash
echo "Installing Wazuh Agent"
echo "This install will setup a Wazuh Agent"
read -p "Please Provide the IPv4 Address of the Wazuh Server" ipadd
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | gpg --no-default-keyring --keyring gnupg-ring:/usr/share/keyrings/wazuh.gpg --import && chmod 644 /usr/share/keyrings/wazuh.gpg
echo "deb [signed-by=/usr/share/keyrings/wazuh.gpg] https://packages.wazuh.com/4.x/apt/ stable main" | tee -a /etc/apt/sources.list.d/wazuh.list
apt-get update -y
WAZUH_MANAGER="$ipadd" apt-get install wazuh-agent
exit
