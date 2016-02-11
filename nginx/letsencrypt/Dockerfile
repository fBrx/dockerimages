FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get install -y nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/usr/share/nginx/www"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git

ENV DEBIAN_FRONTEND noninteractive
RUN git clone https://github.com/letsencrypt/letsencrypt /opt/letsencrypt
RUN /opt/letsencrypt/letsencrypt-auto --help all
ENV LE_MAIL= LE_DOMAIN=
ENV LE_CLI --standalone -v -n -t
ENV LE_ARGS --test-cert
ADD run.sh .
RUN chmod a+x run.sh
CMD ["./run.sh"]