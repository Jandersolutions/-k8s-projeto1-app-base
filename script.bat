echo "Criando as imagens..."

docker build -t jandersolutions/projeto-k8s-backend:1.0/.
docker build -t jandersolutions/projeto-k8s-database:1.0/.

echo "Realizando push..."

docker push jandersolutions/projeto-k8s-backend:1.0
docker push jandersolutions/projeto-k8s-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubectl apply -f ./services.yml

echo "Criando deployments..."

kubectl apply -f ./deployment.yml
