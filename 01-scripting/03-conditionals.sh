#!/bin/bash

# --- CONDITIONALS ---
# In MERN (JS): if (fs.existsSync('file1.txt')) { ... } else { ... }
# In Bash: if [ -f "file1.txt" ]; then ... fi

FILE_NAME="file1.txt"

echo "Checking if $FILE_NAME exists..."

# -f checks if a file exists and is a regular file
# Note the spaces inside [ ] are REQUIRED!
if [ -f "$FILE_NAME" ]; then
    echo "$FILE_NAME found! Deleting it for cleanup..."
    rm "$FILE_NAME"
else
    echo "$FILE_NAME does not exist."
fi

# Let's check a directory
DIR_NAME="src"
# -d checks if a directory exists
if [ -d "$DIR_NAME" ]; then
    echo "Directory $DIR_NAME exists."
else
    echo "Directory $DIR_NAME missing."
fi
