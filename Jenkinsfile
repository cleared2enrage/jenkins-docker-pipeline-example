#!/usr/bin/env groovy

node {
  def image
  def container

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
    docker.withRegistry('http://registry.local:5000') {
      image.push 'latest'
    }
  }

  stage ('Deploy') {
    def secondImage = image 'registry.local:5000/jenkins-docker-pipeline-example:latest'
    container = secondImage.run '-p 8000:5000'
  }
}
