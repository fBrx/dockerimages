FROM tarampampam/node
MAINTAINER Florian Brüssel <florian@florian-m.net>

# install pip
RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py --user && \
    export PATH=~/.local/bin:$PATH && \
    pip --version

# install aws-cli
RUN pip install awscli --upgrade --user && \
    aws --version