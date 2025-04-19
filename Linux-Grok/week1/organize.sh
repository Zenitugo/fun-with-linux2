#!/bin/bash

# Step 1: Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi

# Step 2: Create directory structure
base_dir="/home/vagrant/linux_learning/week1"
mkdir -p "$base_dir/text_files"
mkdir -p "$base_dir/scripts"

# Step 3: Move files
mv "$base_dir/docs/"*.txt "$base_dir/text_files/" 2>/dev/null
mv "$base_dir/docs/"*.sh "$base_dir/scripts/" 2>/dev/null



# Polished version from Grok
#!/bin/bash

# Define base directory
base_dir="/home/vagrant/linux_learning/week1"
text_dir="$base_dir/text_files"
scripts_dir="$base_dir/scripts"

# Create directory structure
mkdir -p "$text_dir" "$scripts_dir" || { echo "Failed to create directories"; exit 1; }
echo "Created directories: $text_dir, $scripts_dir"

# Move files from base_dir (not docs/)
if ls "$base_dir"/*.txt >/dev/null 2>&1; then
    mv "$base_dir"/*.txt "$text_dir/" || echo "Failed to move .txt files"
else
    echo "No .txt files found in $base_dir"
fi

if ls "$base_dir"/*.sh >/dev/null 2>&1; then
    mv "$base_dir"/*.sh "$scripts_dir/" || echo "Failed to move .sh files"
else
    echo "No .sh files found in $base_dir"
fi

# Confirm completion
echo "Organization complete!"

