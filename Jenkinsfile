node('master') {
    stage 'Git checkout'
    
    git 'https://github.com/tejasrik/java-tomcat-maven-example'
    
    stage 'Maven'
    bat label: '', script: 'mvn clean package'
    
    stage('SonarQube analysis') {
     withSonarQubeEnv() { // You can override the credential to be used
     bat label: '', script: 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.6.0.1398:sonar'
}
    }  
    stage 'Docker build'
    withCredentials([usernameColonPassword(credentialsId: 'Docker', variable: '')]) {
      bat label: '', script: "docker build -t sanmodi/test ."
      bat label: '', script: "docker push sanmodi/test"
      bat label: '', script: "docker run -d  sanmodi/test"
}
    stage 'terraform'


bat label: '', script: "terraform init"
bat label: '', script: "terraform destroy -auto-approve"
//bat label: '', script: "terraform plan"
//bat label: '', script: "terraform apply -auto-approve"
//bat label: '', script: 'terraform output kubeconfig > "C:/Users/Sanskar Modi/Desktop/.kube/config"'
//bat label: '', script: "kubectl get nodes"

//stage 'Kubernetes'
//try{
  //  bat label: '', script: "kubectl apply -f  ."
//}
//catch(err){
//    bat label: '', script: "kubectl create -f  ."
//}

//bat label: '', script: "kubectl get pods"
//bat label: '', script: "kubectl expose deployment java-webdeployment2 --type=LoadBalancer"
//bat label: '', script: "kubectl get svc"
}
