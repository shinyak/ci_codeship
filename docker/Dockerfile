FROM centos:7

COPY ./yum.repos.d /etc/yum.repos.d
RUN set -x && \
    yum update -y && \
    yum install -y epel-release && \
    yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
    yum install -y httpd && \
    yum install -y git && \
    yum install --enablerepo=epel,remi,remi-php72 -y \
     php \
     php-pdo \
     php-mysqlnd \
     php-mbstring \
     php-xml \
     php-pecl-igbinary \
     php-pecl-msgpack \
     php-pecl-xdebug \
     php-process \
     php-gd \
     php-bcmath \
     php-phpiredis \
     php-pecl-amqp && \
     yum install -y MariaDB-server MariaDB-client && \
    yum -y clean all

# install library
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && composer global require hirak/prestissimo

# modify /etc/php.ini
RUN sed -i -e "s/;date.timezone *=.*$/date.timezone = Asia\/Tokyo/" /etc/php.ini

COPY ./conf/httpd/httpd.conf /etc/httpd/conf/httpd.conf

EXPOSE 80

# enable service.
RUN systemctl enable httpd.service && \
    systemctl enable mariadb.service

# exec.
CMD ["/sbin/init"]
