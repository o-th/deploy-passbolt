# deploy-passbolt
Deployment sequence for self-hosted Passbolt server on Debian 11

### Dependencies
sudo package needed for script execution.
```
apt-get install sudo
```

### Download
Download the files and move it to the deployment server or git clone the repo:

install git package
```
apt-get install git
```

clone git repo
```
git clone https://github.com/o-th/deploy-passbolt
```

### Configure
data/docker-compose-ce.yaml
| Variable | Purpose |
|---|---|
| MYSQL_PASSWORD | MySQL Database password. |
| APP_FULL_BASE_URL | where passbolt will be published at. Includes HTTPs, e.g. https:\\pb.domain.tld |
| DATASOURCES_DEFAULT_PASSWORD | MySQL Database password. Should match value of MYSQL_PASSWORD. |
| EMAIL_DEFAULT_FROM_NAME | Email sender name, e.g. Passbolt - domain.tld |
| EMAIL_DEFAULT_FROM | email address name, e.g. passbolt@domain.tld |
| EMAIL_TRANSPORT_DEFAULT_HOST | smtp server of email provided, e.g. mail.smtp2go.com, smtp.gmail.com, etc |
| EMAIL_TRANSPORT_DEFAULT_USERNAME | smtp server username |
| EMAIL_TRANSPORT_DEFAULT_PASSWORD | smtp server password |
| traefik.http.routers.passbolt-http.rule | FQDN where passbolt will be published. Excludes HTTPs, e.g. "Host(`pb.domain.tld`)" |
| traefik.http.routers.passbolt-https.rule | FQDN where passbolt will be published. Excludes HTTPs, e.g. "Host(`pb.domain.tld`)" |

data/traefik.yaml
| Variable | Purpose |
|---|---|
| EMAIL | Email contact for LetsEncrypt SSL |

functions/create-passbolt-admin.sh
| Variable | Purpose |
|---|---|
| [EMAIL] | Passbolt admin account email |
| [First Name] | Passbolt admin First Name |
| [Last Name] | Passbolt admin Last Name |

### Install
```
sudo chmod +x deploy.sh && bash deploy.sh
```

### Clean
Warning this will delete all docker containers and docker volumes. 
```
docker-compose down && docker rm -f $(docker ps -a -q) && docker volume rm $(docker volume ls -q)
```
