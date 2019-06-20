#!/bin/bash
set -eou pipefail

rg=resource-group-name
location=location-here
fdname=front-door-name
fdfrontend=frontdoor-backend-address-1
fdfrontend2=frontdoor-backend-address-2

az group create -n $rg -l $location

az group deployment create -g $rg --mode Incremental --template-file template.json \
--parameters frontDoorName=$fdname \
--parameters host1_frontend=$fdfrontend \
--parameters host1_frontend2=$fdfrontend2

open https://$fdname.azurefd.net