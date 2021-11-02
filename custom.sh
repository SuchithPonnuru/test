#!/bin/sh
DD_AGENT_MAJOR_VERSION=7 DD_API_KEY=$1 DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"


sudo chmod -R 755 /etc/datadog-agent/datadog.yaml


sudo sed -i 's/# logs_enabled: false/logs_enabled: true/g' /etc/datadog-agent/datadog.yaml
sed -i "0,/# env:.*/s//env: $2 /" /etc/datadog-agent/datadog.yaml



sudo systemctl restart datadog-agent

