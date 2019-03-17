FROM tarampampam/node
MAINTAINER Florian Brüssel <florian@florian-m.net>

RUN apt-get update && \
    apt-get install -y python-dev && \
    python --version

# install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    pip --version

# install aws-cli
RUN pip install awscli --upgrade && \
    aws --version