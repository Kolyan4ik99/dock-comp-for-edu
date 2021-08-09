FROM debian:buster

LABEL maintainer="cclock@student.21-school.ru"

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y nginx openssl

RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=21kazan/CN=cclock" \
    -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

COPY ./conf/nginx.conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
RUN rm -f /etc/nginx/sites-enabled/default

COPY ./tools/init.sh .

EXPOSE 443

CMD bash init.sh
