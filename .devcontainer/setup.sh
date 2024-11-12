#!/bin/bash

mvn clean package

ONEAGENT_ENVIRONMENT_HOST=$(echo $ONEAGENT_INSTALLER_SCRIPT_URL | sed -E 's|https?://([^/]+).*|\1|')
ENVIRONMENT_ID=$(echo "$ONEAGENT_INSTALLER_SCRIPT_URL" | sed -E 's#https://([^.]+).*#\1#')
docker login https://$ONEAGENT_ENVIRONMENT_HOST --username $ENVIRONMENT_ID --password $ONEAGENT_INSTALLER_DOWNLOAD_TOKEN
docker build -t codespaces-playground .
docker run -d codespaces-playground

# docker run -d --restart=on-failure:5 --read-only=true --pid=host --net=host --cap-drop ALL --cap-add CHOWN --cap-add DAC_OVERRIDE --cap-add DAC_READ_SEARCH --cap-add FOWNER --cap-add FSETID --cap-add KILL --cap-add NET_ADMIN --cap-add NET_RAW --cap-add SETFCAP --cap-add SETGID --cap-add SETUID --cap-add SYS_ADMIN --cap-add SYS_CHROOT --cap-add SYS_PTRACE --cap-add SYS_RESOURCE --security-opt apparmor:unconfined -v /:/mnt/root -v /storage:/mnt/volume_storage_mount -e ONEAGENT_ENABLE_VOLUME_STORAGE=true -e ONEAGENT_INSTALLER_SCRIPT_URL=$ONEAGENT_INSTALLER_SCRIPT_URL -e ONEAGENT_INSTALLER_DOWNLOAD_TOKEN=$ONEAGENT_INSTALLER_DOWNLOAD_TOKEN dynatrace/oneagent --set-monitoring-mode=fullstack --set-app-log-content-access=true