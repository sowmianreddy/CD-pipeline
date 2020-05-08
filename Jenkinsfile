pipeline {
  agent any 
  stages {
    stage('Create Packer AMI') {
        steps {

         withCredentials([
            usernamePassword(credentialsId: 'awsCred', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY')
          ])
		//packer build -debug -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer.json 
		// withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_KEY', credentialsId: 'awsCred', secretKeyVariable: 'AWS_SECRET']]) 
		  {
			sh '''
			echo $AWS_KEY > test1
			echo $AWS_SECRET > test2
			cd packer
			pwd
			/usr/local/bin/packer --version
			/usr/local/bin/packer --help
	    '''
        }
      }
    }
    stage('AWS Deployment') {
      steps {
         // withCredentials([
           // usernamePassword(credentialsId: 'awsCred', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
           // usernamePassword(credentialsId: 'repoCred', passwordVariable: 'REPO_PASS', usernameVariable: 'REPO_USER'),
          //]) 
		  
		  withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_KEY', credentialsId: 'awsCred', secretKeyVariable: 'AWS_SECRET']]) 
		  {
           // sh 'rm -rf repository'
           // sh 'git clone https://github.com/suhasulun/repository.git'
            sh '''
               cd terra
               /usr/local/bin/terraform init
               /usr/local/bin/terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
              // git add terraform.tfstate
               // git -c user.name="sowmianreddy" -c user.email="sowmianreddy@gmail.com" commit -m "terraform state update from Jenkins"
               // git push @github.com/suhasulun/repository.git">https://${REPO_USER}:${REPO_PASS}@github.com/suhasulun/repository.git master
            '''
        }
      }
    }
  }
}
