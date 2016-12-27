node('Linux'){

  try{
      def mvnHome = tool 'M3'
      env.PATH = "${mvnHome}/bin:${env.PATH}"
      
   stage name: 'Git Clone', concurrency: 1
      	checkout([$class: 'GitSCM', branches: [[name: '*/master']], 
		doGenerateSubmoduleConfigurations: false, extensions: [], 
		submoduleCfg: [], 
		userRemoteConfigs: [[credentialsId: 'jenks', url: 'git@github.com:RocketScienceProjects/dockerapp.git']]])
		
   stage name: 'Install_docker', concurrency: 1	
     //check if docker is installed already or not
        sh 'libs/docker_install.sh' 
   
   
   		
		
   stage name: 'Build', concurrency: 1	
       sh 'mvn package docker:build -DpushImage'
   }

  catch(err){
    stage 'Send Email Notification'
      emailext(to: "nirish.okram@gmail.com",
        subject: "Jenkins Build ${JOB_NAME} ${BUILD_NUMBER} Failed...",
        body: "<p>Hi,<br>Jenkins Job Link :  ${env.BUILD_URL}<br> <strong>Failed with Error</strong>: <i>${err}</i></p>  <p>Thanks<br>TestAdmin<br></p>",
        mimeType: 'text/html');

        throw err
       currentBuild.result = 'FAILURE'
  }

}