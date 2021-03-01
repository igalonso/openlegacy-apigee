GCP_PROJECT=$1
REGION=$2
WORKLOAD=$3

gcloud auth configure-docker

echo "--------------1. Building the docker image ------------"
docker build --tag $WORKLOAD .
echo "--------------2. Pushing the docker image  ------------"
docker tag $WORKLOAD gcr.io/$GCP_PROJECT/$WORKLOAD
docker push gcr.io/$GCP_PROJECT/$WORKLOAD
echo "--------------3. Creating a GKE Cluster    ------------"

gcloud config set compute/zone $REGION-b
gcloud config set project $GCP_PROJECT

gcloud container clusters create $WORKLOAD

echo "--------------4. Deploying OpenLegacy API   ------------"

cp deployment.yaml.template deployment.yaml

#For docker

sed -i "s/<GCP_PROJECT>/$GCP_PROJECT/g" deployment.yaml

#For Mac

sed  -i '' "s/<GCP_PROJECT>/$GCP_PROJECT/g" deployment.yaml
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
echo "Now let's sleep a bit to wait the LB to be prepared"
sleep 60
echo "OpenLegacy endpoint is: http://$(kubectl get service ilb-service -o json | jq '.status.loadBalancer.ingress[0].ip' -r)/swagger/swagger.json"