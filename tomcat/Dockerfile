FROM anapsix/alpine-java:jdk8

WORKDIR /opt

#download and install tomcat
RUN wget http://mirror.netcologne.de/apache.org/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz && \
	wget https://www.apache.org/dist/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz.sha1 && \
	sha1sum -cw apache-tomcat-8.0.30.tar.gz.sha1 && \
	tar -xzf apache-tomcat-8.0.30.tar.gz -C /opt/ && \
	rm -f apache-tomcat-8.0.30/bin/*.bat && \
	rm -rf apache-tomcat-8.0.30/webapps/docs && \
	rm -rf apache-tomcat-8.0.30/webapps/examples && \
	rm -rf apache-tomcat-8.0.30/webapps/manager && \
	rm -rf apache-tomcat-8.0.30/webapps/host-manager && \
	rm -f apache-tomcat-8.0.30.tar.gz
	
#improve tomcat startup performanc eby setting non blobking random generator
RUN echo "CATALINA_OPTS=-Djava.security.egd=file:/dev/./urandom" > apache-tomcat-8.0.30/bin/setenv.sh && \
	chmod a+x apache-tomcat-8.0.30/bin/setenv.sh

EXPOSE 8080 8009

CMD ["/opt/apache-tomcat-8.0.30/bin/catalina.sh", "run"]