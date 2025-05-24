pipeline {
  agent any
  stages {
    stage('Clone') {
      steps {
        git 'https://github.com/AbdelrhmanEzzat/demo-jenkins.git'
      }
    }
    stage('Build') {
      steps {
        echo 'Building the project...'
      }
    }
  }
}
