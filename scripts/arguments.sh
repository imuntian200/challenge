#!/bin/bash

# Arguments
for i; do
    case "${i}" in
             --cryptocurrencies)   database='cryptocurrencies';;
             --not-constraints) constraints=false;;
             --not-basedata)    basedata=false;;
             --not-dummy)       dummy=false;;
        -p | --production)      production=true;;
        -v | --verbose)         verbose=true;;
        -h | --help)            usage; exit 0;;
    esac
done

# Validate arguments
if [ -z "${database}" ]; then
    e_error "Please select a database\n";
    usage;
    exit 1;
fi

if [ $production == true ]; then
    environment="production"
    host="?"
    port="?"
    username="?"
    password="?"
fi

# Prepare database path location
databaseDirname="${src}/${database}";
