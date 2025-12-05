#!/bin/bash

# --- INTERACTIVITY & ARGUMENTS ---
# In DevOps, we often need scripts that accept input.
# Example: ./deploy.sh production
# "production" is an argument.

# --- Part 1: Command Line Arguments ---
# These are passed when you RUN the script.
# $0 is the name of the script itself.
# $1 is the first argument, $2 is the second, etc.

echo "Script Name: $0"
echo "First Argument (Target Environment): $1"

if [ -z "$1" ]; then
    echo "Warning: No environment specified. Usage: ./06-interactive.sh <env>"
else
    echo "Deploying to $1..."
fi

# --- Part 2: User Input (Interactive) ---
# Sometimes you want to pause and ask the user for confirmation.
# In JS: const answer = prompt("Are you sure?");
# In Bash: read

echo "--------------------------------"
echo "Do you want to continue the deployment? (y/n)"
read -r user_response

# -r prevents backslashes from being interpreted as escape characters.

if [ "$user_response" == "y" ]; then
    echo "Great! Continuing..."
    # Imagine complex logic here
elif [ "$user_response" == "n" ]; then
    echo "Aborting deployment."
else
    echo "Invalid input. Please type 'y' or 'n'."
fi
