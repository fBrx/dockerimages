FROM anapsix/alpine-java:jdk8

# set version info for desired tomcat version
ENV TC_MAJOR 8
ENV TC_VERSION 8.0.30

# calculate download url
ENV TC_URL https://www.apache.org/dist/tomcat/tomcat-$TC_MAJOR/v$TC_VERSION/bin/apache-tomcat-$TC_VERSION.tar.gz

# download and verify tomcat
WORKDIR /opt
RUN wget $TC_URL && \
	wget $TC_URL.sha1 && \
	sha1sum -cw apache-tomcat-$TC_VERSION.tar.gz.sha1

# install tomcat to /opt/apache-tomcat
RUN	mkdir apache-tomcat && \
	tar -xzf apache-tomcat-$TC_VERSION.tar.gz -C apache-tomcat --strip-components=1
	
# remove unnecessary components
RUN	rm -f apache-tomcat/bin/*.bat && \
	rm -rf apache-tomcat/webapps/docs && \
	rm -rf apache-tomcat/webapps/examples && \
	rm -rf apache-tomcat/webapps/manager && \
	rm -rf apache-tomcat/webapps/host-manager && \
	rm -f apache-tomcat-$TC_VERSION.*
	
#improve tomcat startup performance by setting non blocking random generator
RUN echo "CATALINA_OPTS=-Djava.security.egd=file:/dev/./urandom" > apache-tomcat/bin/setenv.sh && \
	chmod a+x apache-tomcat/bin/setenv.sh

WORKDIR /opt/apache-tomcat

# expose http and jmx ports
EXPOSE 8080 8009

# run tomcat by default
CMD ["/opt/apache-tomcat/bin/catalina.sh", "run"]