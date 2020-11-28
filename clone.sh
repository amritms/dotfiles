#!/bin/sh

echo "Cloning repositories..."

SITES=$HOME/Projects

# Personal
git clone git@github.com:amritms/invoice-gateways.git $SITES/open-source/invoice-gateways
git clone git@github.com:amritms/waveapps-client-php.git $SITES/open-source/waveapps-client-php

