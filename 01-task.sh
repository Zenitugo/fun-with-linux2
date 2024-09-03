#!/bin/bash

input_file="$1"

echo "##################### Ensure Script Has Root Privileges #####################"
if [[ "$(id -u)" -ne 0 ]]; then
    echo "The script must be run with root privileges"
    sudo -E "$0" "$@"
    exit 1
fi

echo "####################### Check if Input Argument is Available or if the File Exists #######################"
if [[ -z "$input_file" || ! -f "$input_file" ]]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

password_dir="/etc/ugochi"
password_file="/etc/ugochi/users_passwords.csv"
log_dir="/var/log"
log_file="/var/log/log-management.txt"

echo "####################### Create Log Directory #######################"
if [[ ! -d "$log_dir" ]]; then
    echo "Log directory $log_dir does not exist. Creating log directory......."
    mkdir -p "$log_dir"
else
    echo "Log directory $log_dir exists"
fi

echo "####################### Clear Previous Log Files #######################"
> "$log_file"  # This is optional

echo "####################### Create Log Function #######################"
log_output(){
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$log_file"
}

echo "####################### Check if Password Directory Exists #######################"
if [[ ! -d "$password_dir" ]]; then
    echo "Password directory $password_dir does not exist. Creating password directory......."
    mkdir -p "$password_dir"
    log_output "Password directory $password_dir has been created"
else
    echo "Password directory $password_dir exists"
fi

echo "############################## Create Password File ###########################"
echo "username,password" > "$password_file"
chmod 600 "$password_file"
log_output "Password file created"

echo "################### Function to Generate Random Password ################"
generate_password(){
    local urandom_pass; urandom_pass=$(head -c 32 /dev/urandom)
    local user_password; user_password=$(echo "$urandom_pass" | openssl base64 | tr -dc A-Za-z0-9 | head -c 12)
    echo "$user_password"
}

echo "###################### Function to Create Users ####################"
users(){
    local user="$1"

    if [[ -z "$user" ]]; then
        log_output "No user specified"
        return 1
    fi

    if id "$user" &>/dev/null; then
        log_output "User '$user' already exists"
        return 0
    else
        sudo useradd "$user"
        local password; password=$(generate_password)
        echo "$user,$password" >> "$password_file"
        echo "$user:$password" | sudo chpasswd
        log_output "User '$user' created with a generated password"
    fi
}

echo "####################### Check if Input File is Empty #######################"
if [[ ! -s $input_file ]]; then
    echo "Input file is empty"
    exit 1
fi

while IFS=';' read -r user; do
    if [[ -n "$user" ]]; then
        echo "Reading the input file and extracting the user: $user"
        users "$user"
    fi
done < "$input_file"

exit 0
