// pipeline {
//   agent any

//   stages {
//     stage('Apply K8s Deployment') {
//       steps {
//         withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
//           sh 'kubectl apply -f deployment.yaml --validate=false'
//         }
//       }
//     }

//     stage('Check Deployment') {
//       steps {
//         withEnv(["KUBECONFIG=/var/lib/jenkins/.kube/config"]) {
//           sh 'kubectl get deployments'
//           sh 'kubectl get pods'
//         }
//       }
//     }
//   }
// }
pipeline {
  agent any

  environment {
    DOCKER_REGISTRY = 'docker.io'
    DOCKER_REPO = 'abdoezzat99/nodejs-app'
    DOCKER_TAG = 'latest'
    DOCKER_CREDENTIALS_ID = 'docker-hub'
  }

  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Build Docker Image') {
      steps {
        script {
          // Set DOCKER_CONFIG to workspace/.docker so docker CLI can write configs here
          sh """
            export DOCKER_CONFIG=\$WORKSPACE/.docker
            mkdir -p \$DOCKER_CONFIG
            docker build -t ${DOCKER_REPO}:${DOCKER_TAG} .
          """
        }
      }
    }
    stage('Login to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh """
            export DOCKER_CONFIG=\$WORKSPACE/.docker
            docker login -u \$DOCKER_USER -p \$DOCKER_PASS
          """
        }
      }
    }
    stage('Push Docker Image') {
      steps {
        sh """
          export DOCKER_CONFIG=\$WORKSPACE/.docker
          docker push ${DOCKER_REPO}:${DOCKER_TAG}
        """
      }
    }
  }
}
