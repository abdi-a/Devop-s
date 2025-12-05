#!/bin/bash

# This is a comment. DevOps starts with documenting what you do!
# This script will set up a simple environment.

echo "Hello! Starting our DevOps journey..."

# 1. Create a directory for logs
echo "Creating a logs directory..."
mkdir -p logs

# 2. Create a timestamped log file
current_time=$(date "+%Y-%m-%d_%H-%M-%S")
log_file="logs/setup_${current_time}.txt"

echo "Log entry created at $current_time" > "$log_file"

echo "Setup complete! Checked created file:"
ls -l "$log_file"
