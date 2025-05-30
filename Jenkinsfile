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
    agent {
        docker {
            image 'docker:24.0.2'  // Use official Docker image (latest version)
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    environment {
        DOCKER_REGISTRY = 'docker.io'
        DOCKER_REPO = 'abdoezzat99/nodejs-app'
        DOCKER_TAG = 'latest'
        // Docker credentials id from Jenkins Credentials Manager
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
                    docker.build("${DOCKER_REPO}:${DOCKER_TAG}")
                }
            }
        }
        stage('Login to Docker Hub') {
            steps {
                withCredentials([usernamePassword(credentialsId: "${DOCKER_CREDENTIALS_ID}", usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'docker login -u $DOCKER_USER -p $DOCKER_PASS'
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                sh "docker push ${DOCKER_REPO}:${DOCKER_TAG}"
            }
        }
    }
}
