pipeline {
  agent any

  stages {
    stage('Apply K8s Deployment') {
      steps {
        // Set KUBECONFIG env variable to actual file path
        withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
          sh 'kubectl apply -f deployment.yaml'
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
