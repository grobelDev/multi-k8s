docker build -t grobeldev/multi-client -f ./client/Dockerfile ./client
docker build -t grobeldev/multi-server -f ./server/Dockerfile ./server
docker build -t grobeldev/multi-worker -f ./worker/Dockerfile ./worker
docker push grobeldev/multi-client
docker push grobeldev/multi-server
docker push grobeldev/multi-worker
kubectl apply -f k8s
kubectl rollout restart deployment/client-deployment
kubectl rollout restart deployment/server-deployment
kubectl rollout restart deployment/worker-deployment