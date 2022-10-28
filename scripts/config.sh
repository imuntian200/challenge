#!/bin/bash

# Constants

## Environment
environment="local"

## MySQL
host="localhost"
port="3306"
username="root"
password="password"

## Database
databaseDirname="${src}"
database="cryptocurrencies"

## Script
dummy=true
basedata=true
constraints=true
production=false
testing=false
staging=false
verbose=false

## Colors
bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)
purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)