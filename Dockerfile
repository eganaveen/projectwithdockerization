FROM tomcat:jre8
LABEL maintainer="Ega Naveen Reddy"
ADD ./target/vprofile-v1.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
