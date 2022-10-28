#!/bin/bash

ls

# Constants
src=$(pwd)

# Imoprts
source "${src}/scripts/config.sh"
source "${src}/scripts/functions.sh"
source "${src}/scripts/arguments.sh"

# Source code
e_header "Installing Database ${database} on ${environment}"

installDatabase
installFolder "tables"
installFolder "constraints"
installFolder "basedata"
installFolder "dummy"

# Bye!
e_bye

