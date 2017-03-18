#!/usr/bin/env groovy

node {
  stage('Checkout') {
    checkout scm
  }
  stage ('Build') {
    sh 'docker build -t jenkins-docker-pipeline-example .'
  }
}
