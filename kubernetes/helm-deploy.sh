#!/bin/bash

# Set release name and namespace for Prometheus deployment
RELEASE_NAME="prometheus"
NAMESPACE="monitoring"

# Add the Prometheus Helm repository (if not added)
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

# Create namespace if it doesn't exist
kubectl get namespace $NAMESPACE || kubectl create namespace $NAMESPACE

# Deploy Prometheus using the custom values.yaml file
helm upgrade --install $RELEASE_NAME prometheus-community/prometheus \
  --namespace $NAMESPACE \
  -f prometheus/values.yaml

echo "Prometheus deployed successfully in the '$NAMESPACE' namespace."
