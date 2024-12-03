#!/bin/bash

# =====================================================================
# Script Name: variable_comprehensive_examples.sh
# Description: Demonstrates various types of variables in Bash, including
#              user-defined, system-defined, and global variables.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Variables are fundamental components in Bash scripting, allowing the 
# storage and manipulation of data. They can be categorized into different 
# types based on their scope and purpose:
# 
# 1. **User-Defined Variables:**
#    - Created and managed by the user within the script.
#    - Can store various data types such as strings, numbers, arrays, etc.
# 
# 2. **System-Defined Variables:**
#    - Predefined by the system or shell environment.
#    - Include environment variables and special variables that provide
#      information about the system and script execution.
# 
# 3. **Global Variables:**
#    - Accessible throughout the entire script and in any child processes.
#    - Typically created by exporting variables.
# 
# This script showcases examples of each variable type, along with their 
# declarations, usage, scope, and manipulation techniques. Comprehensive 
# comments accompany each example to provide detailed explanations.
# =====================================================================

echo "Demonstrating various types of Bash variables."
echo "--------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: User-Defined Variables
# Demonstrates how to create and use user-defined variables.
# ---------------------------------------------------------------------
echo -e "\nExample 1: User-Defined Variables"
# Declaring user-defined variables
username="jitendra"
age=30
pi=3.14159

# Displaying user-defined variables
echo "Username: $username"
echo "Age: $age"
echo "Value of Pi: $pi"

# ---------------------------------------------------------------------
# Example 2: System-Defined Variables
# Explains and demonstrates the use of system-defined variables.
# ---------------------------------------------------------------------
echo -e "\nExample 2: System-Defined Variables"
# Common system-defined variables
echo "Current User: $USER"
echo "Home Directory: $HOME"
echo "Current Working Directory: $PWD"
echo "Shell Being Used: $SHELL"
echo "Script Name: $0"
echo "Number of Arguments Passed: $#"
echo "All Arguments Passed: $@"

# ---------------------------------------------------------------------
# Example 3: Global Variables
# Shows how to create and use global variables by exporting them.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Global Variables"
# Declaring and exporting a global variable
export GLOBAL_VAR="I am a global variable."

# Function to demonstrate access to global variable
show_global_var() {
    echo "Inside function - GLOBAL_VAR: $GLOBAL_VAR"
}

# Calling the function
show_global_var

# Accessing global variable outside the function
echo "Outside function - GLOBAL_VAR: $GLOBAL_VAR"

# ---------------------------------------------------------------------
# Example 4: Local Variables in Functions
# Demonstrates the use of local variables within functions.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Local Variables in Functions"

my_function() {
    local local_var="I am a local variable."
    echo "Inside function - local_var: $local_var"
    echo "Inside function - GLOBAL_VAR: $GLOBAL_VAR"
}

# Calling the function
my_function

# Attempting to access local variable outside the function
echo "Outside function - local_var: ${local_var:-Not Accessible}"

# ---------------------------------------------------------------------
# Example 5: Arrays in Bash
# Demonstrates how to declare and use arrays.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Arrays in Bash"
# Declaring an indexed array
fruits=("Apple" "Banana" "Cherry" "Date")

# Accessing array elements
echo "First fruit: ${fruits[0]}"
echo "Second fruit: ${fruits[1]}"

# Iterating over array elements
echo "All fruits:"
for fruit in "${fruits[@]}"; do
    echo "- $fruit"
done

# Adding an element to the array
fruits+=("Elderberry")
echo "Added a new fruit: ${fruits[-1]}"

# ---------------------------------------------------------------------
# Example 6: Associative Arrays
# Demonstrates how to declare and use associative arrays.
# ---------------------------------------------------------------------
echo -e "\nExample 6: Associative Arrays"
# Declaring an associative array
declare -A capitals

# Assigning key-value pairs
capitals["USA"]="Washington D.C."
capitals["France"]="Paris"
capitals["Japan"]="Tokyo"

# Accessing associative array elements
echo "The capital of USA is ${capitals["USA"]}."
echo "The capital of France is ${capitals["France"]}."
echo "The capital of Japan is ${capitals["Japan"]}."

# Iterating over associative array keys
echo "All capitals:"
for country in "${!capitals[@]}"; do
    echo "- The capital of $country is ${capitals[$country]}."
done

# ---------------------------------------------------------------------
# Example 7: Variable Arithmetic
# Demonstrates performing arithmetic operations with variables.
# ---------------------------------------------------------------------
echo -e "\nExample 7: Variable Arithmetic"
num1=15
num2=4
sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))
quotient=$((num1 / num2))
remainder=$((num1 % num2))

echo "Numbers: num1=$num1, num2=$num2"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Remainder: $remainder"

# ---------------------------------------------------------------------
# Example 8: Variable Substitution and Manipulation
# Demonstrates how to manipulate variable values using substitution.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Variable Substitution and Manipulation"
filepath="/home/user/documents/report.txt"

# Extracting filename
filename="${filepath##*/}"
echo "Filename: $filename"

# Extracting directory path
dirpath="${filepath%/*}"
echo "Directory Path: $dirpath"

# Replacing part of the string
newpath="${filepath/report/summary}"
echo "Replaced Path: $newpath"

# Getting the length of a variable
echo "Length of filename '${filename}': ${#filename} characters"

# ---------------------------------------------------------------------
# Example 9: Indirect Variables
# Demonstrates how to reference variables indirectly.
# ---------------------------------------------------------------------
echo -e "\nExample 9: Indirect Variables"
var_name="dynamic_var"
dynamic_var="I am dynamically referenced."

# Indirect referencing using !
echo "Indirect Variable Value: ${!var_name}"

# ---------------------------------------------------------------------
# Example 10: Readonly Variables
# Shows how to create variables that cannot be modified or unset.
# ---------------------------------------------------------------------
echo -e "\nExample 10: Readonly Variables"
readonly readonly_var="This variable is read-only."
echo "Readonly Variable: $readonly_var"

# Attempting to modify readonly variable (Uncomment to test)
# readonly_var="Attempting to change."
# echo "Modified Readonly Variable: $readonly_var"

# ---------------------------------------------------------------------
# Example 11: Unsetting Variables
# Demonstrates how to unset (delete) variables.
# ---------------------------------------------------------------------
echo -e "\nExample 11: Unsetting Variables"
temp_var="Temporary Variable"
echo "Temp Variable before unsetting: $temp_var"
unset temp_var
echo "Temp Variable after unsetting: ${temp_var:-Not Set}"

# ---------------------------------------------------------------------
# Example 12: Environment Variables
# Shows how to set and use environment variables.
# ---------------------------------------------------------------------
echo -e "\nExample 12: Environment Variables"
export MY_ENV_VAR="I am an environment variable."
echo "Environment Variable: $MY_ENV_VAR"

# Running a subshell to demonstrate access to environment variable
bash -c 'echo "Accessing MY_ENV_VAR in subshell: $MY_ENV_VAR"'

# ---------------------------------------------------------------------
# Example 13: Special Variables
# Demonstrates the use of special variables like positional parameters, PID, etc.
# ---------------------------------------------------------------------
echo -e "\nExample 13: Special Variables"
echo "Script Name: $0"
echo "First Argument: $1"
echo "Second Argument: $2"
echo "Number of Arguments Passed: $#"
echo "Process ID: $$"
echo "Last Command Exit Status: $?"

# Example usage with arguments (Uncomment to test)
# echo "You passed the following arguments: $@"

# =====================================================================
# End of Script
# =====================================================================
