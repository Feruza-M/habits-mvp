pipeline {
    agent any

    environment {
        APP_IP = '34.228.166.91'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Check Ansible') {
            steps {
                sh '''
                    ansible-playbook \
                    -i ansible/inventory.ini \
                    ansible/deploy.yml \
                    --syntax-check
                '''
            }
        }

        stage('Deploy') {
            steps {
                sh '''
                    ansible-playbook \
                    -i ansible/inventory.ini \
                    ansible/deploy.yml
                '''
            }
        }

        stage('Health Check') {
            steps {
                sh '''
                    sleep 5
                    curl -f http://${APP_IP}:8000/health
                '''
            }
        }
    }

    post {
        success {
            echo 'habits-mvp deployed successfully!'
        }

        failure {
            echo 'Deployment failed!'
        }
    }
}
