#!/bin/bash

input_file=$1


echo "#####################Give script sudo priviledge#####################"
if [[ "$(id -u)" -ne 0 ]]; then
    echo "The script must be run with root priviledges"
    echo "Running as root"
    sudo -E "$0" "$@"
    exit
fi


echo "#######################Check if input argument is available or if the file exist##################"
if [[ -z "$input_file" || ! -f "$input_file" ]]; then
    echo "Usage: $0 <input_file>"
    exit 1
fi

password_dir="/etc/shadow"
password_file="/etc/shadow/users_passwords.csv"
log_dir="/var/log"
log_file="/var/log/log-management.txt"



echo "####################### Create Log Directory #######################"
if [[ ! -d "$log_dir" ]]; then
    echo "Log directory $log_dir does not exist. Creating log directory......."
    mkdir -p "$log_dir"
else
    echo "Log directory $log_dir exist"
fi


echo "####################### Clear previous log files #######################" 
> "$log_file"  #This is optional



echo "####################### Create Log Function #######################"
# Log function will have time and date stamps so we can tract activities
log_output(){
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$log_file"
}




echo "####################### Check if Password directory exixt #######################"
if [[ ! -d "$password_dir" ]]; then
    echo "Password directory $password_dir does not exist. Creating password directory......."
    mkdir -p "$password_dir"
    log_output "Password directory $password_dir has been created"
else
    echo "Password directory $password_dir exist"
fi



echo "############################## Create Password file ###########################"
touch "$password_file"
echo "username,password" > "$password_file"
chmod 600 "$password_file"
log_output "Password file created"



echo "###################Create function to generate random password ################"
users_passwords(){
    urandom_pass=$(head -c 32 /dev/urandom) 
    user_password=$(echo "$urandom_pass" | openssl base64 | tr -dc A-Za-z0-9 | head -c 12)
    echo "$user_password"
}


echo "###################### Function to create users and groups ####################"
user-group(){

}