docker build -t feridqelenderli/multi-client:latest -t feridqelenderli/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t feridqelenderli/multi-server:latest -t feridqelenderli/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t feridqelenderli/multi-worker:latest -t feridqelenderli/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push feridqelenderli/multi-client:latest
docker push feridqelenderli/multi-server:latest
docker push feridqelenderli/multi-worker:latest

docker push feridqelenderli/multi-client:$SHA
docker push feridqelenderli/multi-server:$SHA
docker push feridqelenderli/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=feridqelenderli/multi-server:$SHA
kubectl set image deployments/client-deployment client=feridqelenderli/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=feridqelenderli/multi-worker:$SHA
