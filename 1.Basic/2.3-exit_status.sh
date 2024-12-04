#!/bin/bash

# =====================================================================
# Script Name: exit_status.sh
# Description: Demonstrates various examples of exit statuses and exit codes
#              in Bash, including checking files, directories, and handling
#              different scenarios.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Exit statuses and exit codes are fundamental concepts in Bash scripting,
# serving as indicators of the success or failure of commands and scripts.
# Understanding how to capture, interpret, and utilize these statuses is
# crucial for robust and reliable script development.
#
# - **Exit Status:** A numerical value returned by a command after its execution.
#   - `0`: Indicates success.
#   - Non-zero: Indicates failure or specific error conditions.
#
# - **Exit Code:** Synonymous with exit status; often used interchangeably.
#
# **Key Concepts:**
#
# 1. **Capturing Exit Status:**
#    - The special variable `$?` holds the exit status of the last executed command.
#
# 2. **Using Exit Status in Conditionals:**
#    - `if`, `elif`, `else` statements can evaluate exit statuses to control script flow.
#
# 3. **Custom Exit Codes:**
#    - Scripts can exit with custom codes using the `exit` command to indicate specific error conditions.
#
# 4. **Functions Returning Exit Statuses:**
#    - Functions can return exit statuses using the `return` statement.
#
# 5. **Chaining Commands with `&&` and `||`:**
#    - `&&`: Executes the next command only if the previous one succeeds.
#    - `||`: Executes the next command only if the previous one fails.
#
# 6. **Using `trap` for Cleanup Based on Exit Events:**
#    - `trap` can catch exit signals to perform cleanup tasks.
#
# 7. **Understanding Common Exit Codes:**
#    - Familiarity with standard exit codes helps in interpreting script behaviors.
#
# 8. **Using `set -e` for Immediate Exit on Errors:**
#    - `set -e` makes the script exit immediately if any command returns a non-zero status.
#
# This script provides comprehensive examples covering these aspects,
# demonstrating how to effectively manage and utilize exit statuses and codes
# in various scenarios.
# =====================================================================

echo "Demonstrating various exit status and exit code methods in Bash."
echo "--------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Capturing Exit Status of a Command
# Demonstrates how to capture and display the exit status of commands.
# ---------------------------------------------------------------------
echo -e "\nExample 1: Capturing Exit Status of a Command"
echo "Executing 'ls /':"
ls /
echo "Exit Status of 'ls /': $?"

echo "Executing 'ls /non_existent_directory':"
ls /non_existent_directory
echo "Exit Status of 'ls /non_existent_directory': $?"

# ---------------------------------------------------------------------
# Example 2: Checking if a File Exists
# Demonstrates using exit statuses to verify the existence of a file.
# ---------------------------------------------------------------------
echo -e "\nExample 2: Checking if a File Exists"
FILE="/etc/passwd"

if [ -f "$FILE" ]; then
    echo "File '$FILE' exists."
    exit_status=0
else
    echo "File '$FILE' does not exist."
    exit_status=1
fi

echo "Exit Status after checking file: $exit_status"

# ---------------------------------------------------------------------
# Example 3: Checking if a Directory Exists
# Demonstrates using exit statuses to verify the existence of a directory.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Checking if a Directory Exists"
DIRECTORY="/tmp"

if [ -d "$DIRECTORY" ]; then
    echo "Directory '$DIRECTORY' exists."
    exit_status=0
else
    echo "Directory '$DIRECTORY' does not exist."
    exit_status=1
fi

echo "Exit Status after checking directory: $exit_status"

# ---------------------------------------------------------------------
# Example 4: Using Exit Status in Conditional Statements
# Demonstrates how to use exit statuses within 'if-else' statements to control script flow.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Using Exit Status in Conditional Statements"
echo "Attempting to create a directory named 'test_dir':"
mkdir test_dir

if [ $? -eq 0 ]; then
    echo "Directory 'test_dir' created successfully."
else
    echo "Failed to create directory 'test_dir'. It may already exist."
fi

echo "Attempting to create the same directory again to trigger an error:"
mkdir test_dir

if [ $? -eq 0 ]; then
    echo "Directory 'test_dir' created successfully."
else
    echo "Failed to create directory 'test_dir'. It may already exist."
fi

# ---------------------------------------------------------------------
# Example 5: Custom Exit Statuses with the 'exit' Command
# Demonstrates how to exit a script with specific status codes to indicate success or failure.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Custom Exit Statuses with the 'exit' Command"
echo "Exiting the script with status code 0 (Success)."
# Uncomment the line below to exit the script here.
# exit 0

echo "Exiting the script with status code 1 (General Error)."
# Uncomment the line below to exit the script here.
# exit 1

# ---------------------------------------------------------------------
# Example 6: Functions Returning Exit Statuses
# Demonstrates how functions can return different exit codes based on conditions.
# ---------------------------------------------------------------------
echo -e "\nExample 6: Functions Returning Exit Statuses"

check_directory() {
    if [ -d "$1" ]; then
        echo "Directory '$1' exists."
        return 0
    else
        echo "Directory '$1' does not exist."
        return 1
    fi
}

check_directory "/etc"
echo "Exit Status of 'check_directory /etc': $?"

check_directory "/non_existent_directory"
echo "Exit Status of 'check_directory /non_existent_directory': $?"

# ---------------------------------------------------------------------
# Example 7: Chaining Commands with '&&' and '||'
# Demonstrates executing commands based on the success or failure of preceding commands.
# ---------------------------------------------------------------------
echo -e "\nExample 7: Chaining Commands with '&&' and '||'"
echo "Creating 'another_test_dir' and navigating into it:"
mkdir another_test_dir && cd another_test_dir && echo "Successfully navigated into 'another_test_dir'."

echo "Attempting to navigate into a non-existent directory with '&&':"
cd non_existent_directory && echo "This message will not be displayed."

echo "Attempting to navigate into a non-existent directory with '||':"
cd non_existent_directory || echo "Failed to navigate into 'non_existent_directory'."

# Navigate back to the parent directory for further examples
cd ..

# ---------------------------------------------------------------------
# Example 8: Handling Exit Statuses in Loops
# Demonstrates controlling loop execution based on exit statuses.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Handling Exit Statuses in Loops"
echo "Searching for '.conf' files in the current directory:"

for file in *.conf; do
    if [ -f "$file" ]; then
        echo "Found configuration file: $file"
    else
        echo "No configuration files found."
        break
    fi
done

# ---------------------------------------------------------------------
# Example 9: Using 'trap' to Handle Exit Events
# Demonstrates executing cleanup commands based on script exit.
# ---------------------------------------------------------------------
echo -e "\nExample 9: Using 'trap' to Handle Exit Events"

cleanup() {
    echo "Performing cleanup tasks..."
    rm -rf test_dir another_test_dir complex_dir debug_dir
    echo "Cleanup completed."
}

trap cleanup EXIT

echo "Creating directories 'complex_dir' and 'debug_dir' for cleanup demonstration."
mkdir complex_dir debug_dir

echo "Exiting the script to trigger the 'trap' cleanup function."
# Uncomment the line below to exit the script and trigger cleanup.
# exit 0

# ---------------------------------------------------------------------
# Example 10: Understanding Common Exit Status Codes
# Explores standard exit codes and their meanings.
# ---------------------------------------------------------------------
echo -e "\nExample 10: Understanding Common Exit Status Codes"
echo "Listing 'exit_status.sh' with correct permissions:"
ls -l exit_status.sh
echo "Exit Status: $?"

echo "Listing a file without proper permissions (simulated by attempting to access '/root'):"
ls /root
echo "Exit Status: $?"

echo "Attempting to execute a non-executable script:"
chmod -x exit_status.sh
./exit_status.sh 2> exec_error.log
echo "Exit Status: $?"
echo "Content of exec_error.log:"
cat exec_error.log

# Reset permissions for future use
chmod +x exit_status.sh

# ---------------------------------------------------------------------
# Example 11: Using 'set -e' for Immediate Exit on Errors
# Demonstrates enabling strict error handling to terminate scripts on failure.
# ---------------------------------------------------------------------
echo -e "\nExample 11: Using 'set -e' for Immediate Exit on Errors"
echo "Enabling 'set -e' to exit the script on any command failure."
set -e

echo "This command will succeed."
echo "Success: $?"

echo "This command will fail and cause the script to exit."
ls /another_non_existent_directory
echo "This message will not be displayed due to 'set -e'."

# ---------------------------------------------------------------------
# Example 12: Using '&&' for Dependent Command Execution
# Demonstrates executing commands only if the preceding command succeeds.
# ---------------------------------------------------------------------
echo -e "\nExample 12: Using '&&' for Dependent Command Execution"
echo "Creating a new directory 'dependent_dir' and navigating into it:"
mkdir dependent_dir && cd dependent_dir && echo "Successfully created and entered 'dependent_dir'."

echo "Attempting to create the same directory again using '&&':"
mkdir dependent_dir && echo "This message will not be displayed because the directory already exists."

# Navigate back to the parent directory for further examples
cd ..

# ---------------------------------------------------------------------
# Example 13: Capturing Exit Status of Pipelines
# Demonstrates how to capture the exit status of the last command in a pipeline.
# ---------------------------------------------------------------------
echo -e "\nExample 13: Capturing Exit Status of Pipelines"
echo "Piping 'grep' to search for a pattern in a file:"
grep "root" /etc/passwd | wc -l
echo "Exit Status of the pipeline: ${PIPESTATUS[@]}"

echo "Piping 'grep' to search for a non-existent pattern in a file:"
grep "nonexistentpattern" /etc/passwd | wc -l
echo "Exit Status of the pipeline: ${PIPESTATUS[@]}"

# ---------------------------------------------------------------------
# Example 14: Using Exit Statuses for Debugging
# Demonstrates how to use exit statuses to debug scripts and commands.
# ---------------------------------------------------------------------
echo -e "\nExample 14: Using Exit Statuses for Debugging"
echo "Attempting to execute a complex command sequence:"
mkdir debug_dir && cd debug_dir && touch debug_file.txt && echo "Debugging is fun!" > debug_file.txt || { echo "An error occurred in the command sequence."; exit 1; }
echo "Successfully executed the command sequence."

# Navigate back to the parent directory
cd ..

echo -e "\nAll examples completed. Review the outputs and log files as needed."

# =====================================================================
# End of Script
# =====================================================================

