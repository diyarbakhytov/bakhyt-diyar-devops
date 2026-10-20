pipeline {
    agent any

    environment {
        STUDENT_NAME    = 'Diyar'
        STUDENT_SURNAME = 'Bakhyt'
        STUDENT_GROUP   = 'IT2-2301'
        STUDENT_ID      = '38310'
        IMAGE           = 'bakhyt-diyar-devops'
        CONTAINER       = 'bakhyt-diyar-container'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
                sh 'git log -1 --oneline'
            }
        }
        stage('Build') {
            steps {
                sh '''
                    echo "Student: $STUDENT_NAME $STUDENT_SURNAME"
                    echo "Group: $STUDENT_GROUP"
                    echo "Student ID: $STUDENT_ID"
                    python3 -m py_compile app/app.py
                    bash -n scripts/Bakhyt_Diyar_system.sh
                '''
            }
        }
        stage('Test') {
            steps {
                sh '''
                    test -f Bakhyt_Diyar_info.txt
                    test -f Dockerfile
                    bash scripts/Bakhyt_Diyar_system.sh
                '''
            }
        }
        stage('Docker Build') {
            steps {
                sh 'docker build -t $IMAGE .'
            }
        }
        stage('Docker Run') {
            steps {
                sh '''
                    docker rm -f $CONTAINER || true
                    docker run -d --name $CONTAINER \
                      -e STUDENT_NAME=$STUDENT_NAME \
                      -e STUDENT_SURNAME=$STUDENT_SURNAME \
                      -e STUDENT_GROUP=$STUDENT_GROUP \
                      -e STUDENT_ID=$STUDENT_ID \
                      $IMAGE
                    sleep 3
                    docker logs $CONTAINER
                    docker ps --filter name=$CONTAINER
                '''
            }
        }
    }

    post {
        success { echo 'Pipeline finished successfully' }
        failure { echo 'Pipeline failed' }
    }
}
