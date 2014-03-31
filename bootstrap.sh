#!/usr/bin/env bash

apt-get install -y php5
echo 'installing php-pear'
apt-get install -y php-pear php5-dev
echo 'installing pecl'
pecl install mongo
rm /etc/php5/apache2/php.ini
cp /vagrant/php.ini /etc/php5/apache2/php.ini

rm -rf /var/www
ln -fs /vagrant/www /var/www
/etc/init.d/apache2 restart

curl -sS https://getcomposer.org/installer | php
php composer.phar create-project learninglocker/learninglocker=dev-master /var/www/learninglocker
