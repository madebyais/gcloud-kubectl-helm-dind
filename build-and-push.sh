#!/bin/sh

set -e
set -x

# To use this, you have to set several environment variables
#
#   TARGET_GCR_URL => target gcr url e.g. asia.gcr.io
#   GCP_PROJECT_ID => gcp project id
#   APP_NAME => your application name
#   VERSION => the version of your application
#       - use BITBUCKET_COMMIT if using bitbucket runner e.g. ${BITBUCKET_COMMIT:0:8}

export IMAGE_VERSION_TAG=$(echo $TARGET_GCR_URL/$GCP_PROJECT_ID/$APP_NAME:$VERSION)

docker build . -t $IMAGE_VERSION_TAG
docker push $IMAGE_VERSION_TAG