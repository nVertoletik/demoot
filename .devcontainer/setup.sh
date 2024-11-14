#!/bin/bash

# mvn clean package

ENVIRONMENT_ID=$(echo "$DT_ENVIRONMENT_URL" | sed -E 's#https://([^.]+).*#\1#')
sudo sh -c "echo \"ENVIRONMENT_ID=$ENVIRONMENT_ID\" >> /etc/environment"
echo "export ENVIRONMENT_ID=$ENVIRONMENT_ID" >> ~/.bashrc
export ENVIRONMENT_ID=$ENVIRONMENT_ID

DT_ENVIRONMENT_HOST="$ENVIRONMENT_ID.live.dynatrace.com"
export DT_ENVIRONMENT_HOST
sudo sh -c "echo \"DT_ENVIRONMENT_HOST=$DT_ENVIRONMENT_HOST\" >> /etc/environment"
echo "export DT_ENVIRONMENT_HOST=$DT_ENVIRONMENT_HOST" >> ~/.bashrc

sed -i "s/DYNATRACE_DOCKER_REGISTRY/$DT_ENVIRONMENT_HOST/g" ./frontend/Dockerfile

sed -i "s/#alias ll='ls -l'/alias ll='ls -l'/g" ~/.bashrc

# Download OpenTelemetry Java Auto Instrumentation Agent
wget https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/latest/download/opentelemetry-javaagent.jar

# Log into the docker registry hosted by the environment
docker login https://$DT_ENVIRONMENT_HOST --username $ENVIRONMENT_ID --password $DT_API_TOKEN
docker build -t shop/mvn .
docker-compose up -d --build