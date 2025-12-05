#!/bin/bash

# --- VARIABLES ---
# In Bash, we define variables like this: NAME="Value" (No spaces around the = sign!)
# Since you know MERN, think of this like: const directory_name = "logs"
DIRECTORY_NAME="logs"
MESSAGE="Hello! Starting our DevOps journey..."

# --- SCRIPT START ---
echo $MESSAGE

# 1. Create a directory using the variable
# We use $ to access the value of the variable.
echo "Creating a directory named: $DIRECTORY_NAME"
mkdir -p $DIRECTORY_NAME

# 2. Create a timestamped log file
# $(command) runs a command and saves the output to a variable.
current_time=$(date "+%Y-%m-%d_%H-%M-%S")

# We can combine variables inside strings
log_file="${DIRECTORY_NAME}/setup_${current_time}.txt"

echo "Log entry created at $current_time" > "$log_file"

echo "Setup complete! Checked created file:"
ls -l "$log_file"
