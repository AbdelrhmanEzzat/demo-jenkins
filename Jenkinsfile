pipeline {
  agent any

  stages {
    stage('Apply K8s Deployment') {
      steps {
        configFileProvider([configFile(fileId: 'kubeconfig', variable: 'KUBECONFIG')]) {
          sh 'kubectl apply -f deployment.yaml'
        }
      }
    }

    stage('Check Deployment') {
      steps {
        configFileProvider([configFile(fileId: 'kubeconfig', variable: 'KUBECONFIG')]) {
          sh 'kubectl get deployments'
          sh 'kubectl get pods'
        }
      }
    }
  }
}
