#!/bin/bash

echo "setup"
# mvn clean package

# ONEAGENT_ENVIRONMENT_HOST=$(echo $ONEAGENT_INSTALLER_SCRIPT_URL | sed -E 's|https?://([^/]+).*|\1|')
# ENVIRONMENT_ID=$(echo "$ONEAGENT_INSTALLER_SCRIPT_URL" | sed -E 's#https://([^.]+).*#\1#')
# docker login https://$ONEAGENT_ENVIRONMENT_HOST --username $ENVIRONMENT_ID --password $ONEAGENT_INSTALLER_DOWNLOAD_TOKEN
# docker build -t codespaces-playground .
# docker run -d codespaces-playground
