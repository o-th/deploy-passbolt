#!/bin/bash
#creates the first passbolt admin account.

#create default passbolt user
sudo docker compose -f docker-compose-ce.yaml exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
                                passbolt register_user \
                                -u [EMAIL] \
                                -f [First Name] \
                                -l [Last Name] \
                                -r admin" -s /bin/sh www-data \
                                > defaultaccount.txt

cat defaultaccount.txt