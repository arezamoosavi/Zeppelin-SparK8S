pull:
	docker-compose pull

up:
	docker-compose up -d

logs:
	docker-compose logs -f

ps:
	docker-compose ps

down:
	docker-compose down -v

jars_dl:
	sh jarfile_download.sh

start-kind:
	sh k8s_cluster/kind-with-registry.sh
	kubectl cluster-info

add-spark-kind:
	kubectl create serviceaccount spark
	kubectl create clusterrolebinding spark-role --clusterrole=edit --serviceaccount=default:spark --namespace=default
	kubectl get secrets -o jsonpath="{.items[?(@.metadata.annotations['kubernetes\.io/service-account\.name']=='spark')].data.token}"|base64 --decode && echo > ./dockers/zeppelin/conf/spark_token
	echo -n|openssl s_client -connect 192.168.0.1:6443|openssl x509 -outform PEM > ./dockers/zeppelin/conf/certificate.pem

add-spark-docker:
	docker-compose build spark
	docker tag zeppelin-spark8s_spark:latest 192.168.0.1:5000/main-spark:latest
	docker push 192.168.0.1:5000/main-spark:latest

check-registry:
	curl -X GET http://192.168.0.1:5000/v2/main-spark/tags/list

clear-images:
	docker image prune --filter="dangling=true"

zepp:
	docker-compose up --build -d zeppelin

s3:
	docker-compose up -d s3

to-minio:
	sudo cp -r .storage/data/* .storage/s3/datalake/


run-spark:
	docker-compose exec zeppelin \
	spark-submit --verbose --master k8s://https://192.168.0.1:6443 \
	--deploy-mode cluster \
	--conf spark.kubernetes.authenticate.submission.caCertFile=/opt/zeppelin/spark/k8s_conf/certificate.pem \
	--conf spark.kubernetes.authenticate.submission.oauthTokenFile=/opt/zeppelin/spark/k8s_conf/spark_token \
	--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
	--conf spark.kubernetes.container.image.pullPolicy=Always \
	--conf spark.executor.instances=1 \
	--conf spark.executor.memory=2G \
	--conf spark.executor.cores=1 \
	--conf spark.driver.memory=1G \
	--conf spark.kubernetes.container.image=192.168.0.1:5000/main-spark:latest \
	local:///opt/work-dir/pi.py