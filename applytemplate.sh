#!/bin/bash
set -eou pipefail

rg=frontdoorjd
location=eastus
fdname=jdfd
fdfrontend=deenofdevops.azurewebsites.net
fdfrontend2=deenofdevops-dev.azurewebsites.net

az group create -n $rg -l $location

az group deployment create -g $rg --mode Incremental --template-file template.json \
--parameters frontDoorName=$fdname \
--parameters host1_frontend=$fdfrontend \
--parameters host1_frontend2=$fdfrontend2

open https://$fdname.azurefd.net