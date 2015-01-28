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

## Using as a base image

You can use this image as a base to build your own customized instances. For this you only need a Docker file with at least the following content:

    FROM fbrx/elk

Now you can build and run your image with the following commands:

    docker build -t me/elk .
    docker run --name myelk -d -P me/elk

### Add custom logstash config

To customize the logstash config you can simply put a logstash config file in the folder where your Dockerfile resides.
The filename must follow the following pattern: ```logstash.<myname>.conf```

The result should be a directory structure as follows:


    <projectRoot>
    ├── Dockerfile
    └── logstash.test.conf

### Add custom SSL config

The base image already has a self signed certificate for testing purposes included. Ifyou want to use your own certifcate you can follow the steps below.

To create a self signed certifcate:

1. create private key: ```openssl genrsa -des3 -out server.pass.key -passout pass:<your passphrase> 2048```

1. decrypt private key, so passphrase does not have to be provided when starting nginx and remove encrypted key:
```openssl rsa -in server.pass.key -passin pass:<your passphrase> -out server.key```
```rm server.pass.key```

1. create certificate signing request: ```openssl req -new -key server.key -out server.csr```

1. create certificate: ```openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt```

The result should be a directory structure as follows:

    <projectRoot>
    ├── Dockerfile
    ├── server.crt
    ├── server.csr
    └── server.key
