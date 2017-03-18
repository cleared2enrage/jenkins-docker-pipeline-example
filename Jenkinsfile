#!/usr/bin/env groovy

node {
  stage('Checkout') {
    checkout scm
  }
  stage ('Build') {
    docker.build 'jenkins-docker-pipeline-example'
  }
}
