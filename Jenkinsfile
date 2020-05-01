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
				 sh 'rm -rf terraform-create-ec2-instance'
           			 sh 'git clone https://github.com/sowmianreddy/terraform-create-ec2-instance.git'
           			 sh '''
				   cd terraform-create-ec2-instance
             			  /usr/local/bin/terraform init
              			  /usr/local/bin/terraform apply -auto-approve -var access_key=AKIAYMR2SHI5APMT5LXT -var secret_key=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
             			  git add terraform.tfstate
               
           			 '''
       				 }
	    		}   


		}
	}

}	
