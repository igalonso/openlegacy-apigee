GCP_PROJECT=$1
REGION=$2
WORKLOAD=$3

gcloud auth login

sleep 10
gcloud auth configure-docker

echo "--------------1. Building the docker image ------------"
docker build --tag openlegacy-api .
echo "--------------2. Pushing the docker image ------------"
docker tag openlegacy-api gcr.io/$GCP_PROJECT/$WORKLOAD
docker push gcr.io/$GCP_PROJECT/$WORKLOAD
echo "--------------3. Creating an internal Cloud Run service ------------"
gcloud beta run deploy $WORKLOAD --image gcr.io/$GCP_PROJECT/$WORKLOAD --platform managed --ingress internal --region $REGION --allow-unauthenticated --cpu 2 --memory 1Gi