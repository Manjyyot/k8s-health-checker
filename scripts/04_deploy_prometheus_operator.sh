#!/bin/bash

set -e

echo "Adding Prometheus Helm repository..."
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

echo "Installing Prometheus Operator..."
helm install prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --create-namespace

echo "Verifying installation..."
kubectl get pods -n monitoring
