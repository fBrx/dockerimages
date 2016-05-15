# fbrx/tomcat

## Description

This is a minimal docker image containing an Apache Tomcat Web Container, based on Alpine Linux. All additional content (docs, default apps, windows executables) is removed to make the image as lightweight as possible. 

## Usage

You can use this image as a base image (```FROM fbrx/tomcat```) to run your web app on Apache Tomcat. Simply copy the desired war-file (as war or the exploded directory) to /opt/apache-tomcat-<TOMCAT_VERSION>/. The current working dir is the installation directory of tomcat, so you can just add ```ADD my-sample-app.war webapps/``` to your Dockerfile.

Sample Dockerfile:
```
FROM fbrx/tomcat

ADD my-sample-app.war webapps/
```

## Ports

The image exposes two ports:
* ```8080``` - the default http port
* ```8009``` - the JMX connector port
