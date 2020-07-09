node{
    stage ('Git Checkout'){
  git'https://github.com/tejasrik/Selenium-Maven-Template.git'
  
    }
    
    stage('Compile-Package'){
      // Get maven home path
     //def mvnHome =  tool name: 'maven3.6.3', type: 'maven' 
     //batlabel "${mvnHome}/bin/mvn package"
  // bat "${mvnHome}/bin/mvn clean package"
 // bat label: '', script: "${mvnHome}/bin/mvn clean package"
 bat label: '', script: 'mvn clean package'
    }
   
   stage('SonarQube Analysis') {
       withSonarQubeEnv() { // You can override the credential to be used
bat label: '', script: 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
}
    stage('publish docker'){
    bat label: '', script: 'docker build -t tejasrik/jenkinspipeline .'
    bat label:'',script:'docker login -u tejasrik -p Tejasri@6523'
    bat label:'',script:'docker push tejasrik/jenkinspipeline'
    bat label:'',script:'docker run -d tejasrik/jenkinspipeline'
    }
    
    
        
   }
    
  
  
}




