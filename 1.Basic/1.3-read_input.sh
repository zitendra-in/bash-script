#!/bin/bash

# =====================================================================
# Script Name: read_input.sh
# Description: Demonstrates various usages of the 'read' command in Bash.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# The 'read' command in Bash is used to take input from the user or from 
# a file and assign it to one or more variables. It is commonly used in 
# scripts to interactively receive user input, process data line by line,
# and more. Below are various examples demonstrating different features 
# and options of the 'read' command.
# =====================================================================

echo "Demonstrating various 'read' command examples in Bash."
echo "--------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Basic Usage
# Reads a single line of input from the user and stores it in the variable 'name'.
# ---------------------------------------------------------------------
echo -e "\nExample 1: Basic Usage"
echo -n "Please enter your name: "
read name
echo "Hello, $name!"

# ---------------------------------------------------------------------
# Example 2: Prompting with -p
# The -p option allows you to provide a prompt directly with the read command.
# ---------------------------------------------------------------------
echo -e "\nExample 2: Using -p for Prompting"
read -p "Enter your favorite programming language: " language
echo "Your favorite programming language is $language."

# ---------------------------------------------------------------------
# Example 3: Silent Input with -s
# The -s option makes the input silent (no characters are echoed). Useful for passwords.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Silent Input (Password)"
read -sp "Enter your password: " password
echo -e "\nPassword entered successfully."

# ---------------------------------------------------------------------
# Example 4: Limiting Input with -n
# The -n option limits the number of characters to read. Here, it reads 1 character.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Limiting Input to 1 Character"
read -n 1 -p "Press any key to continue... " key
echo -e "\nYou pressed: $key"

# ---------------------------------------------------------------------
# Example 5: Timeout with -t
# The -t option sets a timeout for input. If no input is received within the time, read fails.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Input with Timeout"
read -t 5 -p "You have 5 seconds to enter something: " timed_input
if [ $? -eq 0 ]; then
    echo "You entered: $timed_input"
else
    echo -e "\nNo input received within timeout."
fi

# ---------------------------------------------------------------------
# Example 6: Reading Multiple Variables
# Read can split input into multiple variables based on the IFS (Internal Field Separator).
# ---------------------------------------------------------------------
echo -e "\nExample 6: Reading Multiple Variables"
echo -n "Enter your first name and last name separated by space: "
read first_name last_name
echo "First Name: $first_name"
echo "Last Name: $last_name"

read -p "Enter your first name and last name separated by space: " first_name last_name
echo "First Name: $first_name"
echo "Last Name: $last_name"

# ---------------------------------------------------------------------
# Example 7: Using IFS to Change Delimiter
# By default, IFS(Internal Field Separator) splits input on spaces, tabs, and newlines. You can change it.
# ---------------------------------------------------------------------
echo -e "\nExample 7: Using IFS to Change Delimiter"
IFS=',' read -p "Enter three comma-separated values: " var1 var2 var3
echo "Value 1: $var1"
echo "Value 2: $var2"
echo "Value 3: $var3"
# Reset IFS to default
unset IFS

# ---------------------------------------------------------------------
# Example 8: Reading from a File
# Using a while loop to read a file line by line.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Reading from a File"
# Create a sample file
sample_file="sample_input.txt"
echo -e "Line 1\nLine 2\nLine 3" > "$sample_file"

echo "Contents of $sample_file:"
cat "$sample_file"

echo -e "\nReading file line by line:"
while IFS= read -r line
do
    echo "Read line: $line"
done < "$sample_file"

# Cleanup sample file
rm "$sample_file"

# ---------------------------------------------------------------------
# Example 9: Reading into an Array
# Using the read command with the -a option to read words into an array.
# ---------------------------------------------------------------------
echo -e "\nExample 9: Reading into an Array"
read -p "Enter several space-separated values: " -a array
echo "You entered the following values:"
for element in "${array[@]}"; do
    echo "$element"
done

# ---------------------------------------------------------------------
# Example 10: Reading Until EOF
# Using read in a loop to process all input until End Of File (EOF).
# ---------------------------------------------------------------------
echo -e "\nExample 10: Reading Until EOF"
echo "Type some lines (press CTRL+D to end):"
while read -r line
do
    echo "You typed: $line"
done

echo -e "\nEnd of input."

# =====================================================================
# End of Script
# =====================================================================
