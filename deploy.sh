#!/bin/bash
# Application Deployment Script
# Deploys the Hello World Application Via Puppet

# Load Any Proxies
. ./proxy.sh

# Execute Deployment Via Puppet
echo include ruby::app::helloWorld | puppet apply --modulepath ./modules/ -v -d
