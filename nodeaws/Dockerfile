FROM tarampampam/node
MAINTAINER Florian Brüssel <florian@florian-m.net>

RUN apt-get update && \
    apt-get isntall -y \
    python \
    py-pip \
    groff \
    less \
    mailcap \
    && \
    pip install awscli --upgrade --user && \
    apk -v --purge del py-pip && \
    rm /var/cache/apk/*