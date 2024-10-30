pipeline {
    agent any
    tools {
        maven 'my-maven'
    }
    stages{
        stage('Deleting container and volume before build') {
            steps{
                sh 'docker compose -f deployment.yml down -v'
            }
        }

        stage('Buiding/Deployment') {
            steps {
                sh 'mvn clean package -Dmaven.test.failure.ignore=true'

                echo "Starting Docker commands..."
                    withDockerRegistry(credentialsId:'docker', url: 'https://index.docker.io/v1/') {
                        sh 'docker compose -f deployment.yml up -d --build'
                        sh 'docker compose -f deployment.yml push'
                    }
            }
        }

        stage('Removeing all') {
            steps {
                echo "Shutting down and removing Docker containers sdfsdf"
            }
        }
    }

    post{
        always {
            echo "Cleaning up workspace"
            cleanWs()
        }
    }
}