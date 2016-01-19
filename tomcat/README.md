# fbrx/tomcat

## description

This is a minimal docker image containing an Apache Tomcat Web Container, based on Alpine Linux. All additional content is removed to make the image as lightweight as possible. 

## Usage

You can use this image as a base image (```FROM fbrx/tomcat```) to run your web app on Apache Tomcat. Simply copy the desired war-file (as war or the exploded directory) to /opt/apache-tomcat-8.0.30/. The current working dir is the installation directory od tomcat, so you can just add ```ADD my-sample-app.war webapps/``` to your Dockerfile.

Sample Dockerfile:
```
FROM fbrx/tomcat

ADD my-sample-ap.war webapps/
```
