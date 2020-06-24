node('master') {
    stage 'Git checkout'
    
    git 'https://github.com/Sanskar-Modi/java-tomcat-maven-example'
    
    stage 'Maven'
    bat label: '', script: 'mvn clean package'
    
    stage('SonarQube analysis') {
withSonarQubeEnv() { // You can override the credential to be used
bat label: '', script: 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
}
    }  
    stage 'Docker build'
    withCredentials([usernameColonPassword(credentialsId: 'Docker', variable: '')]) {
   bat label: '', script: "docker build -t sanmodi/test1 ."
//bat label: '', script: "docker login -u sanmodi -p sanskar12345"
bat label: '', script: "docker push sanmodi/test"
bat label: '', script: "docker run -d  sanmodi/test1"
}
    

stage 'Kubernetes'
try{bat label: '', script: "kubectl apply -f  ."}
catch(err){bat label: '', script: "kubectl create -f  ."}

bat label: '', script: "kubectl get pods"

}
