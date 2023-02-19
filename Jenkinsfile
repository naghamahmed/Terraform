pipeline {
    agent any
    tools{
         terraform 'Terraform'
    }
    parameters {
        choice(name: 'workspace', choices:['dev','prod'] )
        choice(name: 'action', choices:['apply','destroy'])
    }
    
    environment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_KEY_ID')
    }

    stages {
        
        stage('check') {
            steps {
                git branch: 'main', credentialsId: 'github-token', url: 'https://github.com/naghamahmed/Terraform.git'
            }
        }
        
        stage('terraform init') {
            steps {
                sh'terraform init'
                sh'terraform workspace new dev || true'
                sh'terraform workspace new prod || true'
            }
        }
        
        
        stage('terraform action') {  
            steps {
                echo"${action}"
                sh"terraform workspace select ${workspace}"
                sh"terraform ${action} --auto-approve --var-file ${workspace}.tfvars "
            }
        } 
    }
}
