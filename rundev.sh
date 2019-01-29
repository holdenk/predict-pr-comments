#!/bin/bash
set -e
set -x
# Auth
gcloud container clusters get-credentials tigeycluster --zone us-central1-a --project boos-demo-projects-are-rad
# Upload the jar
./upload_spark_jar.sh 
# Train the model
export APP_PREFIX="ml10atest"
# Kick off dev & full at the same time
VERSION=dev APP_NAME="$APP_PREFIX$VERSION" MEMORY_OVERHEAD_FRACT=0.35 NUM_EXECS=30 SPARK_DEFAULT_PARALLELISM=100 MAIN_CLASS=com.holdenkarau.predict.pr.comments.sparkProject.ml.MlSCApp INPUT=gs://frank-the-unicorn/$VERSION/output OUTPUT=gs://frank-the-unicorn/$VERSION/ml-$APP_PREFIX CACHE=gs://frank-the-unicorn/$VERSION/ml/dataprep-cache ./run_spark_data_process.sh &
piddev=$!
MEMORY_OVERHEAD_FRACT=0.35 VERSION=full APP_NAME="$APP_PREFIX$VERSION" NUM_EXECS=100 SPARK_DEFAULT_PARALLELISM=1000 MAIN_CLASS=com.holdenkarau.predict.pr.comments.sparkProject.ml.MlSCApp INPUT=gs://frank-the-unicorn/$VERSION/output OUTPUT=gs://frank-the-unicorn/$VERSION/ml-$APP_PREFIX CACHE=gs://frank-the-unicorn/$VERSION/ml/dataprep-cache ./run_spark_data_process.sh &
pidfull = $!
wait $pidfull

# Kick off our year-by-year versions after the fact

VERSION=2019 APP_NAME="$APP_PREFIX$VERSION" NUM_EXECS=60 SPARK_DEFAULT_PARALLELISM=200 MAIN_CLASS=com.holdenkarau.predict.pr.comments.sparkProject.ml.MlSCApp INPUT=gs://frank-the-unicorn/$VERSION/output OUTPUT=gs://frank-the-unicorn/$VERSION/ml-$APP_PREFIX CACHE=gs://frank-the-unicorn/$VERSION/ml/dataprep-cache ./run_spark_data_process.sh
pid2019=$!
MEMORY_OVERHEAD_FRACT=0.35 VERSION=2018 APP_NAME="$APP_PREFIX$VERSION" NUM_EXECS=80 SPARK_DEFAULT_PARALLELISM=300 MAIN_CLASS=com.holdenkarau.predict.pr.comments.sparkProject.ml.MlSCApp INPUT=gs://frank-the-unicorn/$VERSION/output OUTPUT=gs://frank-the-unicorn/$VERSION/ml-$APP_PREFIX CACHE=gs://frank-the-unicorn/$VERSION/ml/dataprep-cache ./run_spark_data_process.sh &
pid2018 = $!
MEMORY_OVERHEAD_FRACT=0.35 VERSION=2017 APP_NAME="$APP_PREFIX$VERSION" NUM_EXECS=80 SPARK_DEFAULT_PARALLELISM=300 MAIN_CLASS=com.holdenkarau.predict.pr.comments.sparkProject.ml.MlSCApp INPUT=gs://frank-the-unicorn/$VERSION/output OUTPUT=gs://frank-the-unicorn/$VERSION/ml-$APP_PREFIX CACHE=gs://frank-the-unicorn/$VERSION/ml/dataprep-cache ./run_spark_data_process.sh &
pid2017 = $!
