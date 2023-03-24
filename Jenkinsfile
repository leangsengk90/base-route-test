pipeline {
    agent { label 'master' }

    stages {
        stage('Build Dockerfile and Push to Docker hub') {
            steps {
                script{
                    docker.withRegistry('', 'dockerhub-auth'){
                        docker.build("xeng/base-route").push("${BUILD_NUMBER}")
                    }
                }
                sh 'docker logout'
            }
        }
        /*
        stage("Deploy Kubernetes Services"){
           steps{
                sh 'scp -o StrictHostKeyChecking=no reactjs-deploy.sh seng@34.142.130.60:/home/seng/k8s-files/reactjs-deploy.sh'
                sh "ssh -o StrictHostKeyChecking=no seng@34.142.130.60 bash /home/seng/k8s-files/reactjs-deploy.sh ${env.BUILD_NUMBER}"
           }
        }
        */
    }
}

