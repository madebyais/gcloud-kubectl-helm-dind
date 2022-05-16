#!/bin/sh

set -e
set -x

# To use this, you have to set several environment variables
#
#   SERVICE_ACCOUNT_KEY_FILE => service account file path e.g. service-account.json
#   TARGET_GCR_URL => target gcr url e.g. asia.gcr.io

gcloud version

gcloud auth activate-service-account --key-file=$SERVICE_ACCOUNT_KEY_FILE
gcloud auth list

docker login -u oauth2accesstoken -p "$(gcloud auth print-access-token)" https://$TARGET_GCR_URL
