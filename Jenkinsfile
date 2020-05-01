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
           				 usernamePassword(credentialsId: 'repoCred', passwordVariable: 'REPO_PASS', usernameVariable: 'REPO_USER'),
         			 ]) {
           			 sh 'rm -rf repository'
           			 sh 'git clone https://github.com/suhasulun/repository.git'
           			 sh '''
              			 cd repository
             			  terraform init
              			  terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
             			  git add terraform.tfstate
               
           			 '''
       				 }
	    		}   


		}
	}

}	
