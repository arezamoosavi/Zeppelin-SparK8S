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

clear-images:
	docker image prune --filter="dangling=true"

minio:
	docker-compose up -d minio


hive:
	docker-compose up -d mariadb
	sleep 2
	docker-compose up -d hive

to-minio:
	sudo cp -r .storage/data/* .storage/minio/datalake/


run-spark:
	docker-compose exec zeppelin \
	spark-submit --verbose --master k8s://https://192.168.0.1:6443 \
	--deploy-mode cluster \
	--conf spark.kubernetes.authenticate.submission.caCertFile=opt/zeppelin/spark/k8s_conf/certificate.pem \
	--conf spark.kubernetes.authenticate.submission.oauthToken=${submission_token} \
	--conf spark.kubernetes.authenticate.driver.serviceAccountName=spark \
	--conf spark.kubernetes.container.image.pullPolicy=Always \
	--conf spark.executor.instances=1 \
	--conf spark.executor.memory=2G \
	--conf spark.executor.cores=1 \
	--conf spark.driver.memory=1G \
	--conf spark.kubernetes.container.image=192.168.0.1:5000/main-spark:latest \
	local:///opt/work-dir/pi.py 3