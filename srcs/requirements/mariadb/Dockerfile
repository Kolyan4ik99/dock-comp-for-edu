FROM debian:buster

LABEL maintaner=:"cclock@student.21-school.ru"

RUN apt-get update && apt-get -y install mariadb-server vim

WORKDIR /var/www
COPY tools/init.sh .
COPY conf/my.cnf /etc/mysql/mariadb.conf.d/

EXPOSE 3306

CMD bash init.sh
