FROM centos:latest

MAINTAINER mbrevda@gmail.com

RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/epel-release.rpm ;\
    rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum install -y \
    php56w \
    php56w-opcache \
    php56w-mysql \
    php56w-mbstring \
    php56w-pecl-xdebug \
    php56w-xml \
    vim \
    git

#set time zone
RUN ln -sf /usr/share/zoneinfo/GMT /etc/localtime

#install latest composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
