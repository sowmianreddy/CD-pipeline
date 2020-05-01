pipeline
{
	agent any
	stages
	{
		stage('Launch AWS instance ' )
		{
			steps {
          			withCredentials([
           				 usernamePassword(credentialsId: 'awsCred', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
         			 ]) {
           			 sh 'git clone https://github.com/sowmianreddy/terraform-create-ec2-instance.git'
           			 sh '''
             			  /usr/local/bin/terraform init
              			  /usr/local/bin/terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
             			  git add terraform.tfstate
               
           			 '''
       				 }
	    		}   


		}
	}

}	
