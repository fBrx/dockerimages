# fbrx/elk

## Description

A base image for playing around with the ELK stack.

Kibana and elasticsearch are deployed behind a nginx instance. This allows to reduce the number of ports which need to be exposed to only one and provides ssl support.
* Kibana is accessible via ```https://<host>:<port>```
* Elasticsearch is available via the context root /elasticsearch: ```https://<host>:<port>/elasticsearch/```

There are also two elasticsearch plugins installed which provide some insight into the current state of the elasticsearch instance:
* [Kopf](https://github.com/lmenezes/elasticsearch-kopf): ```https://dkr/elasticsearch/_plugin/kopf/```
* [Elastic HQ](http://www.elastichq.org/): ```https://dkr/elasticsearch/_plugin/HQ/```

## Usage

Run with ```docker run -d -p 1337:443 fbrx/elk``` and explore https://localhost:1337/#/dashboard/file/AccessLogs.json

In case you are running boot2docker you need to substitute localhost with your boot2docker ip or host (if you mapped id). You can check the current ip of your boot2docker host with the command ```boot2docker ip```.

### Add custom logstash config
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
