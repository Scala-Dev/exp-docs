#!/bin/bash

set -e

K8S_DEPLOYMENT=docs

GCLOUD_BIN="sudo /opt/google-cloud-sdk/bin/gcloud"
GCLOUD_PROJECT=exp-core-develop
GCLOUD_ZONE=us-east1-d

DOCKER_HOST=gcr.io
DOCKER_IMAGE=$DOCKER_HOST/$GCLOUD_PROJECT/$K8S_DEPLOYMENT:${CIRCLE_BRANCH//\//-}-$CIRCLE_BUILD_NUM-$CIRCLE_SHA1

bundle check --path=vendor/bundle || bundle install --path=vendor/bundle --jobs=4 --retry=3 && bundle exec yarn install && gitbook install && gitbook build

sudo docker build --rm=false -t $DOCKER_IMAGE .

[[ $CIRCLE_BRANCH =~ ^(release\/[^\/.]*|eagle|testing|staging|master)$ ]] || exit 0
$GCLOUD_BIN --quiet components update --version 144.0.0
$GCLOUD_BIN --quiet components update --version 144.0.0 kubectl
echo $GCLOUD_JSON | base64 --decode -i > gcloud.json
$GCLOUD_BIN auth activate-service-account --key-file gcloud.json
$GCLOUD_BIN config set project $GCLOUD_PROJECT

$GCLOUD_BIN docker -- push $DOCKER_IMAGE

[[ $CIRCLE_BRANCH =~ ^(eagle|testing|staging|master)$ ]] || exit 0
$GCLOUD_BIN config set container/use_client_certificate True
$GCLOUD_BIN config set compute/zone $GCLOUD_ZONE
$GCLOUD_BIN config set container/cluster $CIRCLE_BRANCH
$GCLOUD_BIN container clusters get-credentials $CIRCLE_BRANCH
sudo chown -R ubuntu:ubuntu /home/ubuntu/.kube
kubectl set image deployment/$K8S_DEPLOYMENT $K8S_DEPLOYMENT=$DOCKER_IMAGE
kubectl rollout status deployment/$K8S_DEPLOYMENT
