#!/usr/bin/env groovy

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
    docker.withServer('tcp://jag-python-dev:2376', 'jag-python-dev-docker-engine') {
      sh 'docker run --rm jenkins-docker-pipeline-example tests.py'
    }
  }

  stage ('Push') {
    docker.withServer('tcp://jag-python-dev:2376', 'jag-python-dev-docker-engine') {
      docker.withRegistry('http://registry.local:5000') {
        output.push 'latest'
      }
    }
  }

  stage ('Deploy') {
    docker.withServer('tcp://jag-python-dev:2376', 'jag-python-dev-docker-engine') {
      sh 'docker-compose build'
      sh 'docker-compose up -d'
    }
  }
}
