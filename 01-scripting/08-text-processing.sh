#!/bin/bash

# --- TEXT PROCESSING (grep & sed) ---
# In DevOps, we often need to read logs or modify config files automatically.

# 1. Setup: Create a dummy config file
CONFIG_FILE="app.conf"
echo "Creating dummy config file..."
# 'cat > file <<EOF' is a way to write multiple lines to a file at once.
cat > $CONFIG_FILE <<EOF
# Application Configuration
PORT=3000
HOST=localhost
DEBUG=false
DB_NAME=production_db
EOF

echo "--- Original File Content ---"
cat $CONFIG_FILE

# 2. GREP: Searching for text
# Usage: grep "search_term" filename
echo -e "\n--- 1. Finding the DB setting with grep ---"
grep "DB_NAME" $CONFIG_FILE

# We can check if a setting exists using grep in an 'if' statement
# -q means "quiet" (don't print the output, just return success/fail)
if grep -q "DEBUG=true" $CONFIG_FILE; then
    echo "Debug mode is ON"
else
    echo "Debug mode is OFF"
fi

# 3. SED: Stream Editor (Replacing text)
# Usage: sed 's/find/replace/' filename
# s = substitute

echo -e "\n--- 2. Changing configuration with sed ---"
echo "Enabling Debug mode..."

# This only PRINTS the change to the screen, it doesn't save it yet.
sed 's/DEBUG=false/DEBUG=true/' $CONFIG_FILE

# To SAVE the change to the file, we use the -i (in-place) flag.
# Note: On Mac, you might need: sed -i '' 's/.../...'
sed -i 's/DEBUG=false/DEBUG=true/' $CONFIG_FILE

echo "--- Verified File Content (after sed -i) ---"
grep "DEBUG" $CONFIG_FILE

# 4. AWK (Bonus): Extracting specific columns
# Imagine a log file: "INFO 2025-12-04 User logged in"
# We want just the date (2nd column).
echo -e "\n--- 3. Extracting data with awk ---"
LOG_LINE="INFO 2025-12-04 User_123 logged_in"
echo "Log line: $LOG_LINE"
# awk splits the line by spaces. $1 is first word, $2 is second, etc.
DATE=$(echo "$LOG_LINE" | awk '{print $2}')
USER=$(echo "$LOG_LINE" | awk '{print $3}')
echo "Extracted Date: $DATE"
echo "Extracted User: $USER"

# Cleanup
rm $CONFIG_FILE
