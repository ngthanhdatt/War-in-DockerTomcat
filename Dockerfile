FROM tomcat:9

RUN rm -f /usr/local/tomcat/webapps/*

COPY target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
