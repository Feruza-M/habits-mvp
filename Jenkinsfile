pipeline {
    agent any

    environment {
        APP_IP = '54.226.164.204'
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
                      ansible/playbook.yml \
                      --syntax-check

                    ansible-playbook \
                      -i ansible/inventory.ini \
                      ansible/deploy.yml \
                      --syntax-check
                '''
            }
        }

        stage('Install Docker') {
            steps {
                sh '''
                    ansible-playbook \
                      -i ansible/inventory.ini \
                      ansible/playbook.yml
                '''
            }
        }

        stage('Deploy') {
            steps {
                withCredentials([
                    string(
                        credentialsId: 'habits-database-url',
                        variable: 'HABITS_DATABASE_URL'
                    )
                ]) {
                    sh '''
                        ansible-playbook \
                          -i ansible/inventory.ini \
                          ansible/deploy.yml
                    '''
                }
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
