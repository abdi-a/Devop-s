#!/bin/bash

# --- LOOPS ---
# In MERN (JS), you might use: for (let i = 1; i <= 5; i++) { ... }
# In Bash, we can loop through numbers or lists.

echo "--- Loop 1: Looping through a list of names ---"
# We will create specific folders for a project structure
# "src", "dist", "test" are the items in our list
for folder in src dist test; do
    echo "Creating folder: $folder"
    mkdir -p $folder
done

echo "--- Loop 2: Looping through numbers ---"
# Let's create 5 dummy files for testing
# {1..5} expands to 1 2 3 4 5
for i in {1..5}; do
    filename="file$i.txt"
    echo "Creating file: $filename"
    touch $filename
done

echo "--- Cleanup ---"
echo "Listing all created items:"
ls -d src dist test file*.txt
