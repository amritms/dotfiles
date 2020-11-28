#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Projects

# Personal
git clone git@github.com:amritms/invoice-gateways.git $SITES/open-source/invoice-gateways
git clone git@github.com:amritms/waveapps-client-php.git $SITES/open-source/waveapps-client-php
git clone git@github.com:amritms/docker-multi-project-mysql57.git $SITES/mysql57
git clone git@github.com:amritms/docker-multi-project-mysql8.git $SITES/mysql
git clone git@github.com:amritms/docker-postgres.git $SITES/postgres

