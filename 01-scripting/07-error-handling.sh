#!/bin/bash

# --- ERROR HANDLING ---
# In DevOps, if a step fails, we usually want to STOP immediately.
# By default, Bash keeps going even if a command fails.

# 1. The "Exit on Error" flag
# Uncommenting the next line would make the script stop immediately if ANY command fails.
# set -e 

echo "--- Step 1: Try to list a non-existent file ---"
ls non_existent_file.txt
# The command above fails (exit code 2).
# Because we didn't use 'set -e', the script continues.

echo "--- Step 2: Checking the exit code ---"
# $? stores the exit code of the LAST command.
# 0 = Success
# Non-zero = Failure

if [ $? -ne 0 ]; then
    echo "Previous command failed! But I caught it."
else
    echo "Previous command succeeded."
fi

echo "--- Step 3: Chaining commands (&& and ||) ---"
# && runs the second command ONLY if the first one SUCCEEDS
# || runs the second command ONLY if the first one FAILS

mkdir -p new_folder && echo "Folder created successfully."
ls non_existent_file.txt || echo "Listing failed, as expected."

echo "--- Step 4: Custom Exit Codes ---"
# We can force the script to fail with a specific code.
# This is how CI/CD pipelines know something went wrong.

FILE="important_config.txt"
if [ ! -f "$FILE" ]; then
    echo "Error: Critical file $FILE is missing!"
    exit 1 # Stop the script right here with an error.
fi

echo "This line will never run if the file is missing."
