#!/bin/bash

# # Check if Minikube is installed
# if ! command -v minikube &> /dev/null
# then
#     echo "Minikube could not be found. Please install Minikube first."
#     exit
# fi

# # Check if kubectl is installed
# if ! command -v kubectl &> /dev/null
# then
#     echo "kubectl could not be found. Please install kubectl first."
#     exit
# fi

# # Start Minikube
# echo "Starting Minikube..."
# minikube start

# # Set Docker environment to Minikube's
# eval $(minikube docker-env)

# Apply Kubernetes configurations
echo "Applying Kubernetes configurations..."

# For Postgres
kubectl apply -f k8s/postgres/postgres-pvc.yaml
kubectl apply -f k8s/postgres/postgres-deployment.yaml

# For Frontend
kubectl apply -f k8s/frontend/frontend-deployment.yaml
kubectl apply -f k8s/frontend/frontend-service.yaml

# For Backend (assuming it's in 'server' directory as you mentioned)
kubectl apply -f k8s/server/backend-deployment.yaml
kubectl apply -f k8s/server/backend-service.yaml

# Show status of the pods
echo "Waiting for pods to start..."
sleep 10  # giving it a few seconds before fetching pod statuses
kubectl get pods

# Inform the user about service URLs
echo "List of available services:"
minikube service list

echo "Deployment completed. You can access the services using the above URLs."
