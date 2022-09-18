# -- Software Stack Version
SPARK_VERSION='3.2.1'
HADOOP_VERSION='3.2'
JUYPTERLAB_VERSION='3.3.0'

# -- Building  Imcd ages
build_docker:
	docker build \
	-f docker/python-base.Dockerfile \
	-t python-base . \
	&& \
	docker compose -f docker/docker-compose.yml up --build

run:
	docker run -p 8888:8888 \
  	-v "${PWD}":/home/jovyan/work \
  	jupyterlab-pyspark