#!/bin/bash

set -e

CLUSTER_NAME="k8s-health-checker-cluster"
REGION="us-east-1"

echo "Creating EKS cluster: $CLUSTER_NAME in $REGION..."

eksctl create cluster \
  --name $CLUSTER_NAME \
  --region $REGION \
  --nodegroup-name worker-nodes \
  --node-type t3.medium \
  --nodes 2 \
  --nodes-min 1 \
  --nodes-max 3 \
  --managed

echo "EKS cluster $CLUSTER_NAME created successfully."
