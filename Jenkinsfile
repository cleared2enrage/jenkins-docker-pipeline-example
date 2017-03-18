#!/usr/bin/env groovy

node {
  stage('Checkout') {
    checkout scm
  }
  stage ('Build') {
    steps {
      docker.build('jenkins-docker-pipeline-example')
    }
  }
}
