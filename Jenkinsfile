pipeline {
    agent any

    stages {
        stage('Build Dockerfile and Push to Docker hub') {
            steps {
                script{
                    docker.withRegistry('', '0514b382-8f27-477c-948f-d49faa233a28'){
                        docker.build("xeng/reactjs-with-router").push("${BUILD_NUMBER}")
                    }
                }
                sh 'docker logout'
            }
        }
        stage("Deploy Kubernetes Services"){
           steps{
                sh 'scp -o StrictHostKeyChecking=no reactjs-deploy.sh seng@34.142.130.60:/home/seng/k8s-files/reactjs-deploy.sh'
                sh "ssh -o StrictHostKeyChecking=no seng@34.142.130.60 bash /home/seng/k8s-files/reactjs-deploy.sh ${env.BUILD_NUMBER}"
           }
        }
    }
}

