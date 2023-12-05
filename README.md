# Akamai
This repo contains the configuration of Akamai using terraform.

## Make changes
1. On a feature branch, make your changes
2. Run `terraform fmt` to keep the formatting  
3. Run `terraform plan` and verify that the plan reflects the change you want to do
4. Push the code and create a PR
5. Wait for the Github action to create a plan and publish it as a comment
6. Get a reviewer to approve it
7. Merge it, and verify that it got applied: https://app.terraform.io/app/snyk/workspaces/akamai-config/runs

## Import Existing Infrastructure
### DNS zone
1. Install the Akamai CLI: https://developer.akamai.com/cli
2. Run `akamai install terraform`
3. create an API key: https://developer.akamai.com/legacy/introduction/Prov_Creds.html
4. Save the content of credential in ~/.edgerc :
```
[default]
host = <Base hostname without the scheme>
client_token = <Client token>
client_secret = <Secret>
access_token = <Access Token>
```
5. Run:
```
akamai terraform --section=default create-zone testprimaryzone.com --resources
akamai terraform --section=default create-zone testprimaryzone.com --createconfig
```
now you would have a terraform file
6. use `terraform import` to import all the resources
