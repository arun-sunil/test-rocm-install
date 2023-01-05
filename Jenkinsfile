pipeline {
    agent {
        node {label env.BUILD_NODE}
    }

    stages {
        stage('Test ROCm Installation') {
            parallel {
                stage('Ubuntu 20.04 - Installer') {
                    steps {
                        sh("docker run --rm -v \$(pwd):/test ubuntu:20.04 /test/test-installer.sh")
                    }
                }

                stage('Ubuntu 22.04 - Installer') {
                    steps {
                        sh("docker run --rm -v \$(pwd):/test ubuntu:22.04 /test/test-installer.sh")
                    }
                }

                stage('Ubuntu 20.04 - Legacy') {
                    steps {
                        sh("docker run --rm -v \$(pwd):/test ubuntu:20.04 /test/test-legacy.sh")
                    }
                }

                stage('Ubuntu 22.04 - Legacy') {
                    steps {
                        sh("docker run --rm -v \$(pwd):/test ubuntu:22.04 /test/test-legacy.sh")
                    }
                }
            }
        }
    }
}
