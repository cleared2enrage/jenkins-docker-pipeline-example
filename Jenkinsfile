#!/usr/bin/env groovy

node {
  def image
  docker.withRegistry 'http://registry:5000'
  
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
    image.push 'latest'
  }
}
