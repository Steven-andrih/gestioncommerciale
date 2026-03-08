FROM tomcat:10-jdk21
COPY ./target/gestioncommerciale.war /usr/local/tomcat/webapps/gestioncommerciale.war
EXPOSE 8080
CMD [ "catalina.sh", "run" ]
