FROM resin/rpi-raspbian:jessie

RUN apt-get update && apt-get install -y nginx

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

VOLUME ["/usr/share/nginx/www"]
VOLUME ["/etc/nginx"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]