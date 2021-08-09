FROM debian:buster

LABEL maintailer="cclock@student.21-school.ru"

RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y php7.3-fpm php-mysql wget

WORKDIR /var/www

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
RUN rm -rf html
RUN mv wordpress/ html/

ADD https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar html/
RUN chmod +x html/wp-cli.phar
RUN mv html/wp-cli.phar /usr/local/bin/wp

COPY conf/wp-config.php html/
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/
COPY ./tools/init.sh .

EXPOSE 9000

CMD bash init.sh
