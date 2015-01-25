# fbrx/elk

A base image for using the ELK stack.

!!! THIS IS STILL WORK IN PROGRESS!!!

run with ```docker run -d -p 1337:80 fbrx/elk``` and explore http://localhost:1337/#/dashboard/file/AccessLogs.json


## Add custom logstash config
Project Layout:
```
<projectRoot>
├── Dockerfile
└── logstash.test.conf
```
Dockerfile
```
FROM fbrx/elk
```
Command
```
docker build -t my/image .
docker run --name myelk -d -P my/image
```
