#!/usr/bin/env groovy

node {
  stage('Checkout') {
    checkout scm
  }
  stage('Identify') {
    sh 'whoami'
  }
  stage ('Build') {
    docker.build 'jenkins-docker-pipeline-example'
  }
}
