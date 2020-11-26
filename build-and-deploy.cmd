call gradle clean build
call docker build . -t vulnerable
call kubectl apply -f scripts/k8/vulnerable-deployment.yaml
call kubectl apply -f scripts/k8/vulnerable-service.yaml
