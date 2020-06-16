FROM tomcat:latest
EXPOSE 8080
ADD target/*.war devops-assignment.war

#ENTRYPOINT ["java" ,"-jar", "/devops-assignment.war"]
