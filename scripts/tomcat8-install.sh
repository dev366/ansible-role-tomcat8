#!/usr/bin/env bash

# Print commands and their arguments as they are executed. (Does nothing if run from ansible.)
#set -o xtrace
# Any subsequent commands which fail will cause the shell script to exit immediately.
set -o errexit

TOMCAT_MAJOR=8
TOMCAT_VERSION=8.0.35
TOMCAT_TGZ_URL=https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
CATALINA_HOME=/opt/tomcat
#USERNAME=$1
#PASSWORD=$2

#sudo groupadd tomcat
#sudo useradd -s /bin/false -g tomcat -d /opt/tomcat tomcat

cd /tmp
wget --no-verbose "$TOMCAT_TGZ_URL" -O tomcat.tar.gz
wget --no-verbose "$TOMCAT_TGZ_URL.asc" -O tomcat.tar.gz.asc

# See https://github.com/docker-library/tomcat/blob/ed98c30c1cd42c53831f64dffa78a0abf7db8e9a/8-jre8/Dockerfile#L33
# and https://www.apache.org/dist/tomcat/tomcat-8/KEYS
#for key in \
#    05AB33110949707C93A279E3D3EFE6B686867BA6 \
#    07E48665A34DCAFAE522E5E6266191C37C037D42 \
#    47309207D818FFD8DCD3F83F1931D684307A10A5 \
#    541FBE7D8F78B25E055DDEE13C370389288584E7 \
#    61B832AC2F1C5A90F0F9B00A1C506407564C17A3 \
#    79F7026C690BAA50B92CD8B66A3AD3F4F22C4FED \
#    9BA44C2621385CB966EBA586F72C284D731FABEE \
#    A27677289986DB50844682F8ACB77FC2E86E29AC \
#    A9C5DF4D22E99998D9875A5110C01C5A2F6059E7 \
#    DCFD35E0BF8CA7344752DE8B6FB21E8933C60243 \
#    F3A04C595DB5B6A5F1ECA43E3B7BBB100D811BBE \
#    F7DA48BB64BCB84ECBA7EE6935CD23C10D498E23 \
#; do \
#    gpg --no-verbose --quiet --batch --no-tty --textmode --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
#done

# Disabled temporarily because I don't know how to import updated keys.
#gpg --no-verbose --quiet --batch --no-tty --verify tomcat.tar.gz.asc tomcat.tar.gz

sudo mkdir -p $CATALINA_HOME
sudo tar xf tomcat.tar.gz -C $CATALINA_HOME --strip-components=1
rm tomcat.tar.gz
rm tomcat.tar.gz.asc

#cd $CATALINA_HOME
#sudo chgrp -R tomcat conf
#sudo chmod g+rwx conf
#sudo chmod g+r conf/*
#sudo chown -R tomcat work/ temp/ logs/

#sudo sed -i 's|</tomcat-users>|<user username="'$USERNAME'" password="'$PASSWORD'" roles="manager-gui,admin-gui"/></tomcat-users>|g' /opt/tomcat/conf/tomcat-users.xml

#sudo cp /vagrant/dev-init-tomcat.conf /etc/init/tomcat.conf
# $CATALINA_HOME/bin/catalina.sh start
#sudo initctl reload-configuration
#sudo initctl start tomcat || sudo initctl restart tomcat
# Or use this: (?)
# sudo service tomcat restart
