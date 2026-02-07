$ErrorActionPreference = "Stop"

$NAME = "k8s-demo-api"
$USERNAME = "tieson18"
$TAG = ":latest"
$IMAGE = "$USERNAME/$NAME$TAG"
Write-Host "Building Docker image..."
docker build -t $IMAGE .

Write-Host "Pushing Docker image to Docker Hub..."
docker push $IMAGE

Write-Host "Deploying to Kubernetes..."
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

Write-Host "Getting pods ..."
kubectl get pods

Write-Host "Getting services ..."
kubectl get services

Write-Host "Fetching main service..."
kubectl get service "$NAME-service"

Write-Host "Deployment complete."
