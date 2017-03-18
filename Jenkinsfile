#!/usr/bin/env groovy

node {
  def image

  stage('Checkout') {
    checkout scm
  }

  stage('Identify') {
    sh 'whoami'
  }

  stage ('Build') {
    image = docker.build 'jenkins-docker-pipeline-example'
  }

  stage ('Push') {
    docker.withRegistry('https://registry') {
      image.push 'latest'
    }
  }
}
