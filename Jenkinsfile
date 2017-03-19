#!/usr/bin/env groovy

def performOnDockerServer(closure) {
  withCredentials([string(credentialsId: 'aws-docker-sandbox-url', variable: 'dockerUrl')]) {
    docker.withServer(dockerUrl, 'aws-docker-sandbox-certificate') {
      closure()
    }
  }
}

node {
  def output
  def container

  stage('Checkout') {
    checkout scm
  }

  stage ('Build') {
    performOnDockerServer() {
      output = docker.build 'jenkins-docker-pipeline-example'
    }
  }

  stage ('Test') {
      sh 'docker run --rm jenkins-docker-pipeline-example tests.py'
    }
  }

  // stage ('Push') {
  //   performOnDockerServer() {
  //     docker.withRegistry('http://registry.local:5000') {
  //       output.push 'latest'
  //     }
  //   }
  // }

  stage ('Deploy') {
    performOnDockerServer() {
      sh 'docker-compose build'
      sh 'docker-compose up -d'
    }
  }
}
