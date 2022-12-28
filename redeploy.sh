kubectl delete -f $1-deployment.yaml
kubectl delete -f $1-service.yaml
kubectl apply -f $1-deployment.yaml
kubectl apply -f $1-service.yaml
