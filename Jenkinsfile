pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Dilshod'
        STUDENT_SURNAME = 'Chorshanbiev'
        STUDENT_GROUP   = 'IT2-2312'
        STUDENT_ID      = '31916'
        IMAGE_NAME      = 'chorshanbiev-dilshod-devops'
        CONTAINER_NAME  = 'chorshanbiev-dilshod-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log --oneline -1'
                echo "Student: ${STUDENT_NAME} ${STUDENT_SURNAME}"
                echo "Group: ${STUDENT_GROUP}"
                echo "Student ID: ${STUDENT_ID}"
            }
        }

        stage('Build') {
            steps {
                sh 'python3 -m py_compile app/app.py'
                echo 'Build OK: app.py compiled without errors'
            }
        }

        stage('Test') {
            steps {
                sh 'test -f Chorshanbiev_Dilshod_info.txt'
                sh 'test -f Dockerfile'
                sh 'bash scripts/Chorshanbiev_Dilshod_system.sh'
                echo 'Test OK: required files exist and script runs'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE_NAME .'
                sh 'docker images $IMAGE_NAME'
            }
        }

        stage('Docker Run') {
            steps {
                sh 'docker rm -f $CONTAINER_NAME || true'
                sh '''docker run -d --name $CONTAINER_NAME -p 8081:8080 \
                    -e STUDENT_NAME=$STUDENT_NAME \
                    -e STUDENT_SURNAME=$STUDENT_SURNAME \
                    -e STUDENT_GROUP=$STUDENT_GROUP \
                    -e STUDENT_ID=$STUDENT_ID \
                    $IMAGE_NAME'''
                sh 'sleep 2'
                sh 'docker ps --filter name=$CONTAINER_NAME'
                sh 'docker logs $CONTAINER_NAME'
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed - check the stage logs above' }
    }
}
