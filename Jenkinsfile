pipeline
{
    agent any
    stages
    {
        stage("Cleaning the workspace")
        {
            steps
            {
                script
                {
                    def workspaceDir = "/var/lib/jenkins/workspace/*"
                    if (fileExists(workspaceDir))
                    {
                        sh "sudo rm -rf ${workspaceDir}*"
                    } 
                }
            }    
        }
        stage('Cloning the project')
        {
            steps
            {
                git branch: 'DataFetch', credentialsId: 'Github-ID', url: 'https://github.com/poojitha200121/DataFetch.git'
            }
        }
        stage("Deleting existing images and containers")
        {
            steps
            {
                script
                {
                    def containers = sh(script: "sudo docker ps -a -q", returnStdout: true).trim()
                    if (containers)
                    {
                        sh "sudo docker stop $containers"
                        sh "sudo docker rm $containers"
                        echo "Containers successfully deleted!!"
                    }
                }
            } 
        }    
        stage("Building images")
        {
            steps {
                sh "sudo docker build -t datafetch-image:V1 /var/lib/jenkins/workspace/DataFetch-PipeLine"
            }
        }
        stage("Running image")
        {
            steps {
                sh "sudo docker run -d --name datafetch-container -p 9090:9090 datafetch-image:V1"
            }
        }
    }
    post
    {
        success
        {
            echo "Eeverything looks fine and its working well"
        }
        failure
        {
            echo "Oops!! something is wrong!"
        }
    }
}
