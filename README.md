# CASE IT Docker stack

Denna repo innehåller Docker-stacken för CASE föreningen och labbet. Alltihop deployas hos [GUD:s portainer](https://portainer.chs.se).

> Om du gör ändringar i systemet, **UPPDATERA DOKUMENTATIONEN!**

# Tjänster
Detta är alla containrarna som körs. Mer detalj finns länkat under de respektive containrarna.

## caselabbetse
- Custom image pushed to Dockerhub
- `/caselabbetse` in the repo

[Full documentation](/caselabbetse)

For hosting caselabbet.se. The container contains a Caddy-webserver serving a static site generated using Astro.

## inventory
- Custom image pushed to Dockerhub
- `/inventory` in the repo

[Full documentation](/inventory)

Ett Pythonskript som sammanställer inventorylistan som används på `caselabbet.se/inventory`.

## LibreBooking
- Lightlyl amended image, pushed to Dockerhub
- `/librebooking` in the repo

[Full documentation](/inventory)

Booking service for handling the resources of the lab, used by both the Association and Chalmers. Accessible on [booked.caselabbet.se](https://booked.caselabbet.se)

## Adminer
- Stock image
Database management tool. Can only be reached through the Tailscale tunnel. Used for pulling backups and doing initial setup.

## Tailscale
- Stock image + Authnyckel
VPN-tunnel för att nå containern internt. Mer detalj under Kallstart.

# Secrets

## Portainer env-variables
Found under portainer -> stack -> Edit Git settings

- `ZETTLE_APIKEY` - Generate an API key on the Zettle retail account with "Products" access
- `DB_ROOT_PWD`,`LB_DBUSER_PWD`,`LB_INSTALL_PWD` - Arbitrary randomly generated passwords, only used between services but should be secure nonetheless.
- `TAILSCALE_AUTHKEY` - Authorisation key for adding additional devices to the tailnet. Should be set to have no expiry ^(due to budgetary concerns in the IT security department of the association) which requires adding a label to the key.

## GitHub repo secrets
Secrets and variables for deploying, found under repo settings > Secrets and Variables > Actions

Secrets
- `DOCKERHUB_TOKEN` - for pushing built images to our dockerhub account
- `PORTAINER_PULL_WEBHOOK` - for triggering the portainer to pull & restart when the docker images are built

Variables
- `DOCKERHUB_USERNAME` = `caselabbet`


# Cold start / Setup
If the container has been wiped or you need to set things up from the start:

- In portainer, add a new stack from repository. 
- Add case-association/caselabbet-docker. 
- Enable GitOps updates.
- Use Webhook.
- Copy the webhook URL and enter it under the secrets on the github repo.
- Enable Re-pull image.
- Set environment variables by uploading the secrets.env file located on Google Drive, or generate new secrets in accordance to the Secrets chapter.

Deploy!


Now log into the Tailscale panel using the CASELABBET GitHub account. See if the tailscale container starts correctly. If you can’t see the container in the device list, you probably need a new Tailscale authentication token which you should set in the environment variables in Portainer. Stop and start the container afterwards. 

Install Tailscale on your computer and connect to the Tailnet. 
On the tailscale admin panel, you should see the container running. Grab the IP (eg. 100.74.9.21) and visit 100.74.9.21:8080. This will bring you to the adminer panel.

We will now upload the database backup: have your backup.sql at hand. Begin by logging in with
- Username: lb_user
- Password is the value of LB_DBUSER_PWD in the .env file.

Now select the librebooking database in the dropdown to the left. The database should be empty. Under the dropdown there’s a button “Import”. Upload the backup and press “Execute”. The site will hang for a minute or two, just wait. It will then say “N queries executed OK”. Booked should now be up and running!
