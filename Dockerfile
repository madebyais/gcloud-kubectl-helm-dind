FROM docker:latest

ENV HELM_VERSION=v3.8.2 \
    GCLOUD_SDK_URL="https://dl.google.com/dl/cloudsdk/release/google-cloud-sdk.tar.gz" \
    PATH="/opt/google-cloud-sdk/bin:${PATH}"

WORKDIR /

COPY install.sh /install.sh
RUN chmod +x /install.sh && /install.sh

COPY gcloud-auth-docker-login-gcr.sh /gcloud-auth-docker-login-gcr.sh
RUN chmod +x /gcloud-auth-docker-login-gcr.sh

COPY build-and-push.sh /build-and-push.sh
RUN chmod +x /build-and-push.sh