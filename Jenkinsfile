#!/usr/bin/env groovy

node {
  def output
  def container

  stage('Checkout') {
    checkout scm
  }

  stage('Identify') {
    sh 'whoami'
  }

  stage ('Build') {
    output = docker.build 'jenkins-docker-pipeline-example'
  }

  stage ('Push') {
    docker.withRegistry('http://registry.local:5000') {
      output.push 'latest'
    }
  }

  stage ('Deploy') {
    def secondImage = docker.image 'registry.local:5000/jenkins-docker-pipeline-example:latest'
    container = secondImage.run '-p 8000:8000'
  }
}
