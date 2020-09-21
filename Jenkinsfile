pipeline {
    agent any
    stages {
        stage('Deploy to k3s') {
            when {
                expression {
                    env.BRANCH_NAME == 'master'
                }
            }
            agent {
                docker {
                    image 'registry-192.168.1.38.nip.io/homeassistant/helm-kubectl:latest'
                    args '-v /var/lib/jenkins/config:/var/lib/jenkins/config'
                }
            }
            steps {
                    echo 'Deploying using helm...'
                    sh 'export KUBECONFIG=/var/lib/jenkins/config && helm delete -n pihole pihole && sleep 10 && helm upgrade --version \'1.7.6\' --namespace pihole --values pihole-values.yaml pihole mojo2600/pihole'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}