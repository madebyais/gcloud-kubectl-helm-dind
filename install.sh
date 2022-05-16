#!/bin/sh

set -e
set -x

apk --update --no-cache add \
  ca-certificates \
  openssl \
  python3 \
  curl \
  bash \
  git

wget -O - -q "${GCLOUD_SDK_URL}" | tar zxf - -C /opt && \
    ln -s /lib /lib64 && \
    gcloud config set core/disable_usage_reporting true && \
    gcloud config set component_manager/disable_update_check true && \
    gcloud config set metrics/environment github_docker_image && \
    gcloud --version && \
    rm -rf /tmp/* && rm -rf /opt/google-cloud-sdk/.install/.backup

# install kubectl
gcloud components install -q kubectl

# install helm
curl --silent --show-error --fail --location --output get_helm.sh https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get
chmod 700 get_helm.sh
./get_helm.sh --version "${HELM_VERSION}"
rm get_helm.sh

if helm version --client | grep -q 'SemVer:"v2';then 
  helm init --client-only
else 
  helm repo add stable https://charts.helm.sh/stable
fi

helm plugin install https://github.com/jkroepke/helm-secrets.git
helm plugin install https://github.com/chartmuseum/helm-push