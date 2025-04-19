#!/bin/bash


# Breaking the questions into steps

# 1. Make sure the script is running as root
# 2. Create base directory if it doesn't exist
# 3. Create log file
# 4. Displays the disk usage
# 5. Display memory usage
# 6. Display free time
# 7. Save the outputs to a file


# Translates into bash concepts



if [[ "$(id -u)" -ne 0 ]]; then
    echo "The script must be run with root priviledges"
    echo "Running as root"
    sudo -E "$0" "$@"
    exit
fi

base_dir="linux-learning/week1"
log_file="sysinfo.log"


# Create base directory if it doesnt exist
if [[ -d "$base_dir" ]]; then
    echo "Directory exist: $base_dir"
else
    mkdir -p "$base_dir"
    echo "Base directory created"
fi

# Move into the base directory
cd "$base_dir" || exit 1



# Create log file 
if [[ -f "$log_file" ]]; then
    echo "Log File exist: $log_file"
else
    touch "$log_file"
    echo "Log file created"
fi



# Function to create timestamp for the log file

loginfo() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$log_file"
}


# Function to display disk usage, memory usage and uptime
systeminfo() {
    loginfo "System information in real time"

    loginfo "Disk Usage:"
    if df -h | grep '^/dev/' | tee -a  "$log_file"; then
        echo "Disk Usage logged"
    else
        loginfo "Error: Failed to retrieve disk usage"
    fi



    loginfo "Memory Usage"
    if free -m | tee -a  "$log_file"; then
         echo "Memory usage logged"
    else
        loginfo "Error: Failed to retrieve memory usage"
    fi


    loginfo "System Uptime"
    if uptime | tee -a "$log_file"; then
        echo "System uptime logged"
    else
        loginfo "Error: Failed to retrieve systemuptime"
    fi
}

systeminfo
echo "System information saved to $log_file"

exit 0