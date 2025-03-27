#!/bin/bash

set -e

CLUSTER_NAME="k8s-health-checker-cluster"
REGION="us-east-1"

echo "Updating kubeconfig for cluster $CLUSTER_NAME..."

aws eks update-kubeconfig --name $CLUSTER_NAME --region $REGION

echo "Verifying cluster access..."
kubectl get nodes
