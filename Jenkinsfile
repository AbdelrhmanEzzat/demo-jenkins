pipeline {
  agent any

  stages {
    stage('Apply K8s Deployment') {
      steps {
        withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
          sh 'kubectl apply -f deployment.yaml --validate=false'
        }
      }
    }

    stage('Check Deployment') {
      steps {
        withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
          sh 'kubectl get deployments'
          sh 'kubectl get pods'
        }
      }
    }
  }
}
