#!/usr/bin/env groovy

env.DOCKER_TLS_VERIFY="1"

node {
  def output
  def container

  stage('Checkout') {
    checkout scm
  }

  stage ('Build') {
    docker.withServer('tcp://jag-python-dev:2376', 'jag-python-dev-docker-engine') {
      output = docker.build 'jenkins-docker-pipeline-example'
    }
  }

  stage ('Test') {
    docker.withServer('tcp://jag-python-dev:2376', 'cc46adf4-0259-409b-9add-2953aff9c68e') {
      sh 'docker run --rm jenkins-docker-pipeline-example tests.py'
    }
  }



  // stage ('Push') {
  //   docker.withServer('tcp://jag-python-dev:2376', 'cc46adf4-0259-409b-9add-2953aff9c68e') {
  //     docker.withRegistry('http://registry.local:5000') {
  //       output.push 'latest'
  //     }
  //   }
  // }

  stage ('Deploy') {
    docker.withServer('tcp://jag-python-dev:2376', 'cc46adf4-0259-409b-9add-2953aff9c68e') {
      sh 'docker-compose build'
      sh 'docker-compose up -d'
    }
  }
}
