pipeline
{
	agent any
	stages
	{
		stage('Launch AWS instance')
		{

			steps {
         			 withCredentials([
            				usernamePassword(credentialsId: 'awsCred', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
          				]) {
            					sh 'rm -rf terraform-create-ec2-instance'
            					sh 'git clone https://github.com/sowmianreddy/terraform-create-ec2-instance.git'
            					sh '''
						cd terraform-create-ec2-instance	
               					terraform init
               					terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
               
            					'''
        				}
				}


		}
	}

}
