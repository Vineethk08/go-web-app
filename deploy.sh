#!/bin/bash

# Script to deploy all Kubernetes manifests
# Make sure you have a Kubernetes cluster running and kubectl configured

echo "Deploying Kubernetes manifests..."

# Apply all YAML files in the manifests directory
kubectl apply -f k8s/manifests/

echo "Deployment complete!"
echo ""
echo "To check the status of your deployments, run:"
echo "  kubectl get deployments"
echo "  kubectl get services"
echo "  kubectl get ingress"
echo ""
echo "To view pods:"
echo "  kubectl get pods"

