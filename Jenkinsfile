pipeline {
    agent any
    stages {
        stage('Helm Dry Run') {
            agent {
                docker {
                    image 'dtzar/helm-kubectl:latest'
                    args '-u root --privileged -v /var/lib/jenkins/config:/var/lib/jenkins/config'
                }
            }
            steps {
                    echo 'Dry run using helm...'
                    sh 'whoami'
                    sh 'ls -l /'
                    sh 'helm repo add mojo2600 https://mojo2600.github.io/pihole-kubernetes/ && helm repo update'
                    sh 'export KUBECONFIG=/var/lib/jenkins/config && helm upgrade --install --version \'2.5.3\' --dry-run --namespace pihole --values pihole-values.yaml pihole mojo2600/pihole'
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
                    sh 'export KUBECONFIG=/var/lib/jenkins/config && helm upgrade --install --version \'2.5.3\' --namespace pihole --values pihole-values.yaml pihole mojo2600/pihole'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
