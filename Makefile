# -- Software Stack Version
SPARK_VERSION='3.2.1'
HADOOP_VERSION='3.2'
JUYPTERLAB_VERSION='3.3.0'

# -- Building  Images
build_docker:
	docker build \
	-f docker/base-image.Dockerfile \
	-t base-image . \
	&& \
	docker build \
	-f docker/jupyterlab-pyspark.Dockerfile \
  	-t jupyterlab-pyspark .

run:
	docker run -p 8888:8888 \
  	-v "${PWD}":/home/jovyan/work \
  	jupyterlab-pyspark