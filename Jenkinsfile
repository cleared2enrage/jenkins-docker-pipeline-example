#!/usr/bin/env groovy

node {
  def dockerHost = 'tcp://ec2-54-183-51-32.us-west-1.compute.amazonaws.com:2376'
  def credentials = 'ec2-54-183-51-32.us-west-1.compute.amazonaws.com'

  def output
  def container

  stage('Checkout') {
    checkout scm
  }

  stage ('Build') {
    docker.withServer(dockerHost, credentials) {
      output = docker.build 'jenkins-docker-pipeline-example'
    }
  }

  stage ('Test') {
    docker.withServer(dockerHost, credentials) {
      sh 'docker run --rm jenkins-docker-pipeline-example tests.py'
    }
  }

  // stage ('Push') {
  //   docker.withServer(dockerHost, credentials) {
  //     docker.withRegistry('http://registry.local:5000') {
  //       output.push 'latest'
  //     }
  //   }
  // }

  stage ('Deploy') {
    docker.withServer(dockerHost, credentials) {
      sh 'docker-compose build'
      sh 'docker-compose up -d'
    }
  }
}
