pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/AbdelrhmanEzzat/jenkins-demo.git'
      }
    }
    stage('Build') {
      steps {
        echo 'Building the project...'
      }
    }
  }
}
