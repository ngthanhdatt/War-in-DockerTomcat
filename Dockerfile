FROM tomcat:9

LABEL maintainer="Nguyen Thanh Dat"

RUN rm -f /usr/local/tomcat/webapps/*

ADD ./target/LoginWebApp-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
