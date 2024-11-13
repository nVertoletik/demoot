#!/bin/bash

# mvn clean package

wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar
ONEAGENT_ENVIRONMENT_HOST=$(echo $ONEAGENT_INSTALLER_SCRIPT_URL | sed -E 's|https?://([^/]+).*|\1|')
echo "export ONEAGENT_ENVIRONMENT_HOST=$ONEAGENT_ENVIRONMENT_HOST" >> ~/.bashrc
ENVIRONMENT_ID=$(echo "$ONEAGENT_INSTALLER_SCRIPT_URL" | sed -E 's#https://([^.]+).*#\1#')
docker login https://$ONEAGENT_ENVIRONMENT_HOST --username $ENVIRONMENT_ID --password $ONEAGENT_INSTALLER_DOWNLOAD_TOKEN