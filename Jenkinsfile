pipeline {
  agent any 
  stages {
    stage('Create Packer AMI') {
        steps {
          withCredentials([
            usernamePassword(credentialsId: 'awsCred', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY')
          ]) {
	    sh '''
	    cd packer
            packer build -debug -var aws_access_key=${AWS_KEY} -var aws_secret_key=${AWS_SECRET} packer/packer.json
	    '''
        }
      }
    }
    stage('AWS Deployment') {
      steps {
          withCredentials([
            usernamePassword(credentialsId: 'awsCred', passwordVariable: 'AWS_SECRET', usernameVariable: 'AWS_KEY'),
           // usernamePassword(credentialsId: 'repoCred', passwordVariable: 'REPO_PASS', usernameVariable: 'REPO_USER'),
          ]) {
           // sh 'rm -rf repository'
           // sh 'git clone https://github.com/suhasulun/repository.git'
            sh '''
               cd terra
               terraform init
               terraform apply -auto-approve -var access_key=${AWS_KEY} -var secret_key=${AWS_SECRET}
              // git add terraform.tfstate
               // git -c user.name="sowmianreddy" -c user.email="sowmianreddy@gmail.com" commit -m "terraform state update from Jenkins"
               // git push @github.com/suhasulun/repository.git">https://${REPO_USER}:${REPO_PASS}@github.com/suhasulun/repository.git master
            '''
        }
      }
    }
  }
}
