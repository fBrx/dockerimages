# fbrx/hugo

## Description

This is a base image for working with Hugo - a fast and modern static website engine. It can either be used to run arbitrary Hugo commands for your project or as a base image for your custom container.

Via command parameters the command which should be used to run Hugo can be selected and parameterized.

The default entrypoint runs the plain ```hugo```command. Any arguments supplied to ```docker run``` will be forwarded to the ```hugo``` command.

## Usage

### As a "on demand" Hugo runtime

The image can be used to run Hugo commands for your project. Since the container needs the Hugo site data available, the correct folder has to be supplied in the ```docker run```command via the ```-v```parameter to be mounted at ```/site```.

See [Volumes](#volumes) for an example.

### As a base image for your custom container

When used as a base image, the image expects to be build from a Hugo project root. Meaning you should have a folder structure as follows when building a container:

```
basePath/
|-- archetypes/
|-- content/
|-- layouts/
|-- public/
|-- static/
|-- themes/
|-- config.toml
```

A sample Dockerfile may look like follows:

```
FROM fbrx/hugo
MAINTAINER me

# customizes the default command when the container is run. The arguments will be supplied to the hugo command.
CMD ["server", "-b", "myhost"]
```


## Configurations

## Entrypoint and CMD

The default entrypoint of the image performs the following steps:

1. clean the /site/public directory
2. run the hugo command with all arguments supplied via the CMD instruction (either via ```Dockerfile``` or arguments to ```docker run```)

The default will just call ```hugo``` without any arguments which will just rebuild your site.

## <a name="volumes"></a>Volumes

When run, the image expects a Hugo site structure at ```/site```. When used as a base image, the contents of the current folder will be added to this folder.

When the image is used "standalone", the folder which should be used has to be specified via the ```-v```flag to the ```docker run``` command.

Example to use the current directory: ```docker run --rm -p 1313:1313 -v ${PWD}:/site fbrx/hugo```

## boot2docker

When the image is used to run your site via ```hugo server``` in conjunction with boot2docker, you have to supply the IP or hostname of your boot2docker host  as the baseUrl to the hugo command.

Example: ```docker run --rm -p 1313:1313 -v ${PWD}:/site fbrx/hugo server -b 192.168.59.103```

The IP of the boot2dpcker host can be obtained by simply running ```boot2docker ip```.
