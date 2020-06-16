FROM tomcat:latest
EXPOSE 8080
ADD target/*.war //usr/local/tomcat/webapps/devops-assignment.war

#ENTRYPOINT ["java" ,"-jar", "/devops-assignment.war"]
