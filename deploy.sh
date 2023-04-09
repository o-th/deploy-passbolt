#!/bin/bash
#main deployment sequence

#install docker
chmod +x functions/install-docker.sh && bash functions/install-docker.sh

#install passbolt
chmod +x functions/install-passbolt.sh && bash functions/install-passbolt.sh

#create default admin account (waits 30s for services to become available.)
sleep 30
chmod +x functions/create-passbolt-admin.sh && bash functions/create-passbolt-admin.sh