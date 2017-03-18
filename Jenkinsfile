#!/usr/bin/env groovy

env.DOCKER_TLS_VERIFY="1"
env.DOCKER_CERT_PATH="/var/jenkins_home/.docker/machine/machines/jag-python-dev"
env.DOCKER_MACHINE_NAME="jag-python-dev"

node {
  def output
  def container

  stage('Checkout') {
    checkout scm
  }

  stage ('Build') {
    docker.withServer('tcp://jag-python-dev:2376', 'cc46adf4-0259-409b-9add-2953aff9c68e') {
      output = docker.build 'jenkins-docker-pipeline-example'
    }
  }

  stage ('Test') {
    sh 'docker run --rm jenkins-docker-pipeline-example tests.py'
  }

  stage ('Push') {
    docker.withRegistry('http://registry.local:5000') {
      output.push 'latest'
    }
  }

  stage ('Deploy') {
    def secondImage = docker.image 'registry.local:5000/jenkins-docker-pipeline-example:latest'
    sh '''
      CONTAINER_NAME='jenkins-docker-pipeline-example'

      CONTAINER_ID=`docker ps -qa --filter "name=$CONTAINER_NAME"`
      if [ -n "$CONTAINER_ID" ]; then
        docker stop $CONTAINER_ID
        docker rm $CONTAINER_ID
      fi
    '''
    container = secondImage.run '-p 8000:8000 --name jenkins-docker-pipeline-example'
  }

  stage ('Deploy Group') {
    sh 'docker-compose build'
    sh 'docker-compose up -d'
  }
}
