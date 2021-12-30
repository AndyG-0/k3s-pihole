pipeline {
    agent any
    stages {
        stage('Helm Dry Run') {
            when {
                expression {
                    env.BRANCH_NAME == 'master'
                }
            }
            agent {
                docker {
                    image 'dtzar/helm-kubectl:latest'
                    args '-v /var/lib/jenkins/config:/var/lib/jenkins/config'
                }
            }
            steps {
                    echo 'Deploying using helm...'
                    sh 'export KUBECONFIG=/var/lib/jenkins/config && helm upgrade --install --version \'2.1.2\' --dry-run --namespace pihole --values pihole-values.yaml pihole mojo2600/pihole'
            }
        }
        stage('Deploy to k3s') {
            when {
                expression {
                    env.BRANCH_NAME == 'master'
                }
            }
            agent {
                docker {
                    image 'dtzar/helm-kubectl:latest'
                    args '-v /var/lib/jenkins/config:/var/lib/jenkins/config'
                }
            }
            steps {
                    echo 'Deploying using helm...'
                    sh 'export KUBECONFIG=/var/lib/jenkins/config && helm upgrade --install --version \'2.1.2\' --namespace pihole --values pihole-values.yaml pihole mojo2600/pihole'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
