#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get -y dist-upgrade

# Remove old rubies, install postgresql git etc
apt-get remove -y -q ruby1.8 ruby1.8-dev ruby1.9.1 ruby1.9.1-dev
apt-get install -y -q build-essential libxml2-dev libxslt1-dev libyaml-dev libsqlite3-dev sqlite3 libmysqlclient-dev libpq-dev
apt-get install -y -q postgresql git nodejs redis-server memcached

# Cleanup
apt-get autoremove -y

usermod -a -G www-data vagrant

if test ! -d /var/jsi; then
    mkdir /var/jsi && chown www-data:www-data /var/jsi && chmod 775 /var/jsi
fi

# Database
su - postgres -c 'psql -c "CREATE ROLE vagrant WITH CREATEDB LOGIN;"'