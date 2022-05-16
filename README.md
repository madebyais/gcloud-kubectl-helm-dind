# gcloud-kubectl-helm-dind

A docker image for gcloud, kubectl and helm.

## Getting Started

There are two important shell script in this docker image.

### gcloud-auth-docker-login-gcr.sh

This shell script will help you to activate your service account and login to target GCR url.

Please find below for required environment variables.

| Variable | Description |
|----------|-------------|
| SERVICE_ACCOUNT_KEY_FILE | service account file path e.g. service-account.json |
| TARGET_GCR_URL | target gcr url e.g. asia.gcr.io |

### build-and-push.sh

This shell script will help you to build your application image and push into the target GCR url.

Please find below for required environment variables.

| Variable | Description |
|----------|-------------|
| TARGET_GCR_URL | target gcr url e.g. asia.gcr.io |
| GCP_PROJECT_ID | gcp project id |
| APP_NAME | your application name |
| VERSION | the version of your application |