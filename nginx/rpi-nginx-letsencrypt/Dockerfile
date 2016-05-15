FROM resin/rpi-raspbian:jessie
MAINTAINER Florian Brüssel <florian@florian-m.net>

ENV DEBIAN_FRONTEND noninteractive

#install nginx and git
RUN apt-get update && apt-get install -y nginx git ca-certificates

# forward nginx request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log

# add volumes for web root and nginx config
VOLUME ["/usr/share/nginx/www"]
VOLUME ["/etc/nginx"]

# download and install letsencrypt client
RUN git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt && \
	/opt/letsencrypt/letsencrypt-auto --help all

# define env variables
ENV LE_CLI --standalone -v -n -t
ENV LE_MAIL= LE_DOMAIN= LE_ARGS=

# cleanup
RUN apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# add start script and set command
ADD run.sh .
RUN chmod a+x run.sh
CMD ["./run.sh"]

# expose default http and https ports
EXPOSE 80 443
