#!/bin/bash

# --- FUNCTIONS & ARGUMENTS ---
# In MERN (JS): 
# function greet(name) { 
#   console.log("Hello " + name); 
# }
# greet("Alice");

# In Bash, we define functions similarly, but arguments are handled differently.

# 1. Defining a simple function
greet_user() {
    # We access arguments using $1, $2, etc.
    # $1 is the first argument passed to the function
    local name=$1 
    echo "Hello, DevOps Engineer $name!"
}

# Calling the function
echo "--- Function Call 1 ---"
greet_user "Alice"

# 2. Function with multiple arguments and return status
create_user_file() {
    local username=$1
    local filename="${username}_config.txt"

    echo "Setting up configuration for $username..."
    
    # Check if argument was provided
    if [ -z "$username" ]; then
        echo "Error: No username provided."
        return 1 # Return error code (like exit 1, but for functions)
    fi

    touch "$filename"
    echo "Config file created: $filename"
    return 0 # Success
}

echo -e "\n--- Function Call 2 ---"
create_user_file "bob"

# Check the return code of the last command (the function)
# $? holds the exit code of the last command. 0 means success.
if [ $? -eq 0 ]; then
    echo ">> Success! Bob is set up."
else
    echo ">> Failed to set up Bob."
fi

echo -e "\n--- Function Call 3 (Error Case) ---"
create_user_file "" # Calling without argument

if [ $? -eq 0 ]; then
    echo ">> Success!"
else
    echo ">> Failed as expected."
fi

# Cleanup
rm *_config.txt 2>/dev/null
