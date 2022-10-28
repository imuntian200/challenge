#!/bin/bash

# Functions

## Logger
e_bold() {
    echo -e "${bold}$@${reset}"
}

e_underline() {
    echo -e "${underline}${bold}$@${reset}"
}

e_title() {
    echo -e "${green}$@${reset}"
}

e_step() {
    echo -e "${blue}•${reset} $@${reset}"
}

e_arrow() {
    echo -e "➜ $@"
}

e_error() {
    echo -e "${red}✖${reset} $@${reset}"
}

e_warning() {
    echo -e "${tan}➜${reset} $@${reset}"
}

e_success() {
    echo -e "${green}✔${reset} $@${reset}"
}

e_header() {
    echo -e "\n${bold}${purple}==========  $@  ==========${reset}"
}

e_normal() {
    echo -e "$@"
}

e_note() {
    echo -e "${underline}${bold}${blue}Note:${reset} ${blue}$@${reset}"
}

e_bye() {
    echo -e "\n${green}Bye!${reset} $@${reset}"
}

## Help
usage() {
    e_normal "${underline}${bold}Usage${reset}:  ./scripts/install.sh [options]"
    e_normal "\tInstall Steplix Database"
    e_normal "\n${underline}${bold}Options${reset}:"
    e_normal "\t     --otp             (?) Install ${bold}One Time Password${reset} (OTP) database."
    e_normal "\t     --notifications   (?) Install ${bold}Notifications${reset} database."
    e_normal "\t     --not-constraints (?) Prevent create constraints. Default true"
    e_normal "\t     --not-basedata    (?) Prevent insert base data. Default true"
    e_normal "\t     --not-dummy       (?) Prevent insert dummy data. Default true"
    e_normal "\t-p | --production      (?) Use PRODUCTION credentials. Default false"
    e_normal "\t-s | --staging         (?) Use STAGING/QA credentials. Default false"
    e_normal "\t-t | --testing         (?) Use TESTING credentials. Default false"
    e_normal "\t-v | --verbose         (?) Display git command outputs. Default false"
    e_normal "\t-h | --help            (?) Display help"
    return 0;
}

## MySQL
executeQuery() {
    local filename=$(basename $1)
    local database=$2

    if [ $verbose == true ]; then
        MYSQL_PWD=${password} mysql -h ${host} -P ${port} -u ${username} ${database} < "$1"
    else
        MYSQL_PWD=${password} mysql -h ${host} -P ${port} -u ${username} ${database} < "$1" 2> /dev/null
    fi

    return $?;
}

installFolder() {
    local dirname="${databaseDirname}"
    local folder="${1}"
    local silent="${3:false}"

    # Verificate if folder exist.
    if [ ! -d $dirname/$folder ]; then
        return 0;
    fi

    if [ ! "${silent}" == "true" ]; then
        e_step "Installing ${folder}...";
    fi

    # Execute all SQL files on folder.
    for file in $dirname/$folder/*; do
        local filename=$(basename $file);

        executeQuery ${file} ${2:$database}

        # If query execution fails, program execution will ends.
        if [ $? -ne 0 ]; then
            e_error "Cannot execute ${filename%.*}.sql"
            exit 1;
        fi

        if [ ! "${silent}" == "true" ]; then
            e_success "${folder} for ${filename%.*} created.";
        fi
    done

    return 0;
}

installDatabase() {
    installFolder "database" " " "true"
    e_success "Database created.";
}

