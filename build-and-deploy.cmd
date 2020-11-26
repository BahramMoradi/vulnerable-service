call gradle clean build
call docker build . -t gateway
REM call docker run -p 8080:8080 -i -t gateway:latest
REM call docker-compose up
call kubectl apply -f scripts/k8/gateway-deployment.yaml
call kubectl apply -f scripts/k8/gateway-service.yaml
