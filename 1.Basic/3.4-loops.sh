#!/bin/bash

# =====================================================================
# Script Name: loops.sh
# Description: Demonstrates various loop constructs in Bash, including
#              for loops, while loops, until loops, nested loops,
#              controlling loops (break, continue), and processing loop
#              outputs. Each section provides detailed explanations and examples.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Loops are fundamental constructs in Bash scripting that allow you to
# execute a block of code multiple times based on certain conditions.
# Understanding different types of loops and their control mechanisms
# is essential for automating repetitive tasks, processing data, and
# managing workflows efficiently.
#
# **Key Loop Constructs:**
#
# 1. **For Loop:**
#    - Iterates over a list of items.
#    - Can use C-style syntax for numerical iterations.
#
# 2. **While Loop:**
#    - Continues to execute as long as a specified condition is true.
#
# 3. **Until Loop:**
#    - Continues to execute until a specified condition becomes true.
#
# 4. **Nested Loops:**
#    - Placing one loop inside another to handle multi-dimensional data.
#
# 5. **Controlling Loops:**
#    - **break:** Exits the loop immediately.
#    - **continue:** Skips the current iteration and proceeds to the next.
#
# 6. **Processing Loop Output:**
#    - Capturing and manipulating the output generated by loops.
#
# **Best Practices:**
#
# - **Use Descriptive Variable Names:** Enhance readability and maintainability.
# - **Avoid Infinite Loops:** Ensure loop conditions will eventually terminate.
# - **Limit Nesting Depth:** Deeply nested loops can become complex and hard to manage.
# - **Use Control Statements Wisely:** Apply `break` and `continue` to manage loop flow effectively.
# - **Handle Loop Outputs Appropriately:** Redirect or process outputs as needed.
#
# This script provides comprehensive examples covering these aspects,
# demonstrating how to effectively implement and manage loop constructs
# in various scenarios.
# =====================================================================

echo "Demonstrating various loop constructs in Bash."
echo "------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Basic For Loop (Iterating Over a List)
# ---------------------------------------------------------------------
echo -e "\nExample 1: Basic For Loop (Iterating Over a List)"
fruits=("Apple" "Banana" "Cherry")

for fruit in "${fruits[@]}"; do
    echo "Fruit: $fruit"
done
# Explanation:
# - Iterates over each element in the 'fruits' array.
# - Prints each fruit to the terminal.

# ---------------------------------------------------------------------
# Example 2: C-Style For Loop (Numerical Iteration)
# ---------------------------------------------------------------------
echo -e "\nExample 2: C-Style For Loop (Numerical Iteration)"
for ((i=1; i<=5; i++)); do
    echo "Iteration: $i"
done
# Explanation:
# - Uses C-style syntax to iterate from 1 to 5.
# - Increments 'i' by 1 in each iteration.

# ---------------------------------------------------------------------
# Example 3: For Loop with Sequence Generation
# ---------------------------------------------------------------------
echo -e "\nExample 3: For Loop with Sequence Generation"
for num in $(seq 1 3); do
    echo "Number: $num"
done
# Explanation:
# - Generates a sequence of numbers from 1 to 3 using 'seq'.
# - Iterates over each number and prints it.

# ---------------------------------------------------------------------
# Example 4: While Loop (Condition-Based Iteration)
# ---------------------------------------------------------------------
echo -e "\nExample 4: While Loop (Condition-Based Iteration)"
count=1
while [ $count -le 3 ]; do
    echo "Count: $count"
    ((count++))
done
# Explanation:
# - Continues to execute the loop as long as 'count' is less than or equal to 3.
# - Increments 'count' by 1 in each iteration.

# ---------------------------------------------------------------------
# Example 5: Until Loop (Until Condition Becomes True)
# ---------------------------------------------------------------------
echo -e "\nExample 5: Until Loop (Until Condition Becomes True)"
count=1
until [ $count -gt 3 ]; do
    echo "Count: $count"
    ((count++))
done
# Explanation:
# - Continues to execute the loop until 'count' is greater than 3.
# - Similar to a while loop but with the condition inverted.

# ---------------------------------------------------------------------
# Example 6: Nested For Loops
# ---------------------------------------------------------------------
echo -e "\nExample 6: Nested For Loops"
colors=("Red" "Green" "Blue")
objects=("Car" "Bike")

for color in "${colors[@]}"; do
    for object in "${objects[@]}"; do
        echo "$color $object"
    done
done
# Explanation:
# - Outer loop iterates over colors.
# - Inner loop iterates over objects.
# - Combines each color with each object.

# ---------------------------------------------------------------------
# Example 7: Nested While Loops
# ---------------------------------------------------------------------
echo -e "\nExample 7: Nested While Loops"
outer=1
while [ $outer -le 2 ]; do
    inner=1
    while [ $inner -le 2 ]; do
        echo "Outer: $outer, Inner: $inner"
        ((inner++))
    done
    ((outer++))
done
# Explanation:
# - Outer loop runs twice.
# - Inner loop runs twice for each iteration of the outer loop.
# - Prints the current iteration numbers of both loops.

# ---------------------------------------------------------------------
# Example 8: Using Break to Exit a Loop Early
# ---------------------------------------------------------------------
echo -e "\nExample 8: Using Break to Exit a Loop Early"
for num in {1..5}; do
    if [ $num -eq 3 ]; then
        echo "Reached number 3, exiting loop."
        break
    fi
    echo "Number: $num"
done
# Explanation:
# - Iterates from 1 to 5.
# - When 'num' equals 3, prints a message and exits the loop using 'break'.

# ---------------------------------------------------------------------
# Example 9: Using Continue to Skip an Iteration
# ---------------------------------------------------------------------
echo -e "\nExample 9: Using Continue to Skip an Iteration"
for num in {1..5}; do
    if [ $num -eq 3 ]; then
        echo "Skipping number 3."
        continue
    fi
    echo "Number: $num"
done
# Explanation:
# - Iterates from 1 to 5.
# - When 'num' equals 3, prints a message and skips to the next iteration using 'continue'.

# ---------------------------------------------------------------------
# Example 10: Controlling Nested Loops with Labels (Bash 4+)
# ---------------------------------------------------------------------
echo -e "\nExample 10: Controlling Nested Loops with Labels (Bash 4+)"
for outer in {1..3}; do
    for inner in {1..3}; do
        if [ $inner -eq 2 ] && [ $outer -eq 2 ]; then
            echo "Breaking out of both loops."
            break 2
        fi
        echo "Outer: $outer, Inner: $inner"
    done
done
# Explanation:
# - Uses 'break 2' to exit both the inner and outer loops when specific conditions are met.
# - Available in Bash version 4 and above.

# ---------------------------------------------------------------------
# Example 11: Processing Loop Output with Command Substitution
# ---------------------------------------------------------------------
echo -e "\nExample 11: Processing Loop Output with Command Substitution"
for file in *; do
    echo "File: $file"
done
# Explanation:
# - Iterates over all files in the current directory.
# - Prints each filename to the terminal.

# ---------------------------------------------------------------------
# Example 12: Redirecting Loop Output to a File
# ---------------------------------------------------------------------
echo -e "\nExample 12: Redirecting Loop Output to a File"
output_file="loop_output.txt"
> "$output_file"  # Truncate or create the file

for num in {1..5}; do
    echo "Number: $num" >> "$output_file"
done

echo "Loop output has been written to '$output_file'."
# Explanation:
# - Iterates from 1 to 5.
# - Appends each number to 'loop_output.txt'.

# ---------------------------------------------------------------------
# Example 13: Reading Lines from a File Using a While Loop
# ---------------------------------------------------------------------
echo -e "\nExample 13: Reading Lines from a File Using a While Loop"
echo "Enter the path to a text file:"
read file_path

if [ -f "$file_path" ]; then
    while IFS= read -r line; do
        echo "Line: $line"
    done < "$file_path"
else
    echo "The file '$file_path' does not exist."
fi
# Explanation:
# - Reads each line from the specified file and prints it.
# - Uses 'IFS= read -r' to preserve leading/trailing whitespace and prevent backslash interpretation.

# ---------------------------------------------------------------------
# Example 14: Using a For Loop to Iterate Over Command Output
# ---------------------------------------------------------------------
echo -e "\nExample 14: Using a For Loop to Iterate Over Command Output"
for user in $(cut -d: -f1 /etc/passwd); do
    echo "User: $user"
done
# Explanation:
# - Extracts usernames from '/etc/passwd' using 'cut'.
# - Iterates over each username and prints it.

# ---------------------------------------------------------------------
# Example 15: Using Until Loop to Wait for a Condition
# ---------------------------------------------------------------------
echo -e "\nExample 15: Using Until Loop to Wait for a Condition"
echo "Checking if the file 'ready.txt' exists..."
until [ -f "ready.txt" ]; do
    echo "File not found. Waiting..."
    sleep 2
done
echo "'ready.txt' has been created."
# Explanation:
# - Continues to check for the existence of 'ready.txt' every 2 seconds.
# - Exits the loop once the file is found.

# ---------------------------------------------------------------------
# Example 16: Infinite Loop with Break Condition
# ---------------------------------------------------------------------
echo -e "\nExample 16: Infinite Loop with Break Condition"
counter=1
while true; do
    echo "Counter: $counter"
    ((counter++))
    if [ $counter -gt 5 ]; then
        echo "Counter exceeded 5, exiting loop."
        break
    fi
done
# Explanation:
# - Creates an infinite loop using 'while true'.
# - Increments a counter and exits the loop when it exceeds 5 using 'break'.

# ---------------------------------------------------------------------
# Example 17: Looping Through Command-Line Arguments
# ---------------------------------------------------------------------
echo -e "\nExample 17: Looping Through Command-Line Arguments"
echo "Script name: $0"
echo "Number of arguments: $#"

for arg in "$@"; do
    echo "Argument: $arg"
done
# Explanation:
# - Iterates over all command-line arguments passed to the script.
# - Prints each argument individually.

# ---------------------------------------------------------------------
# Example 18: Nested For and While Loops
# ---------------------------------------------------------------------
echo -e "\nExample 18: Nested For and While Loops"
for letter in A B C; do
    count=1
    while [ $count -le 2 ]; do
        echo "Letter: $letter, Count: $count"
        ((count++))
    done
done
# Explanation:
# - Outer for loop iterates over letters A, B, and C.
# - Inner while loop runs twice for each letter.
# - Prints the current letter and count.

# ---------------------------------------------------------------------
# Example 19: Processing Array Elements with a For Loop
# ---------------------------------------------------------------------
echo -e "\nExample 19: Processing Array Elements with a For Loop"
declare -a numbers=(10 20 30 40 50)

for num in "${numbers[@]}"; do
    squared=$((num * num))
    echo "Number: $num, Squared: $squared"
done
# Explanation:
# - Iterates over an array of numbers.
# - Calculates and prints the square of each number.

# ---------------------------------------------------------------------
# Example 20: Using C-Style For Loop for Factorial Calculation
# ---------------------------------------------------------------------
echo -e "\nExample 20: Using C-Style For Loop for Factorial Calculation"
echo "Enter a number to calculate its factorial:"
read number

factorial=1
for ((i=1; i<=number; i++)); do
    factorial=$((factorial * i))
done

echo "Factorial of $number is $factorial."
# Explanation:
# - Uses a C-style for loop to calculate the factorial of a given number.
# - Multiplies 'factorial' by each integer from 1 to the input number.

# ---------------------------------------------------------------------
# Example 21: Looping Through Files in a Directory
# ---------------------------------------------------------------------
echo -e "\nExample 21: Looping Through Files in a Directory"
echo "Enter the path to a directory:"
read dir_path

if [ -d "$dir_path" ]; then
    for file in "$dir_path"/*; do
        if [ -f "$file" ]; then
            echo "File: $(basename "$file")"
        fi
    done
else
    echo "'$dir_path' is not a directory."
fi
# Explanation:
# - Iterates over all files in the specified directory.
# - Checks if each item is a regular file before printing its name.

# ---------------------------------------------------------------------
# Example 22: Looping with Read and Here Document
# ---------------------------------------------------------------------
echo -e "\nExample 22: Looping with Read and Here Document"
while read -r line; do
    echo "Line: $line"
done << EOF
First line
Second line
Third line
EOF
# Explanation:
# - Uses a while loop with a here document to read multiple lines.
# - Prints each line prefixed with "Line:".

# ---------------------------------------------------------------------
# Example 23: Using Select for Menu-Driven Loop
# ---------------------------------------------------------------------
echo -e "\nExample 23: Using Select for Menu-Driven Loop"
PS3="Please enter your choice: "
options=("Option 1" "Option 2" "Option 3" "Quit")

select opt in "${options[@]}"; do
    case $opt in
        "Option 1")
            echo "You selected Option 1."
            ;;
        "Option 2")
            echo "You selected Option 2."
            ;;
        "Option 3")
            echo "You selected Option 3."
            ;;
        "Quit")
            echo "Exiting."
            break
            ;;
        *) echo "Invalid option $REPLY";;
    esac
done
# Explanation:
# - Presents a menu to the user using 'select'.
# - Executes actions based on the user's selection.
# - Exits the loop when the user selects "Quit".

# ---------------------------------------------------------------------
# Example 24: Looping Through Command Output with Piping
# ---------------------------------------------------------------------
echo -e "\nExample 24: Looping Through Command Output with Piping"
ps -e | while read -r pid tty time cmd; do
    echo "PID: $pid, Command: $cmd"
done
# Explanation:
# - Pipes the output of 'ps -e' into a while loop.
# - Reads and prints the PID and command name for each process.

# ---------------------------------------------------------------------
# Example 25: Using Loop with Arrays and Indexes
# ---------------------------------------------------------------------
echo -e "\nExample 25: Using Loop with Arrays and Indexes"
declare -a cities=("New York" "Los Angeles" "Chicago" "Houston" "Phoenix")

for ((i=0; i<${#cities[@]}; i++)); do
    echo "City[$i]: ${cities[i]}"
done
# Explanation:
# - Iterates over array indexes.
# - Accesses array elements using their index.

# ---------------------------------------------------------------------
# Example 26: Looping with Read Array Elements and Indices
# ---------------------------------------------------------------------
echo -e "\nExample 26: Looping with Read Array Elements and Indices"
declare -a animals=("Cat" "Dog" "Elephant" "Giraffe")

for index in "${!animals[@]}"; do
    echo "Animal[$index]: ${animals[index]}"
done
# Explanation:
# - Uses `${!array[@]}` to get all the indices of the array.
# - Iterates over each index and accesses the corresponding element.

# ---------------------------------------------------------------------
# Example 27: Looping Through User Input Until 'exit' is Entered
# ---------------------------------------------------------------------
echo -e "\nExample 27: Looping Through User Input Until 'exit' is Entered"
while true; do
    echo -n "Enter a command (type 'exit' to quit): "
    read user_input
    if [ "$user_input" == "exit" ]; then
        echo "Exiting loop."
        break
    fi
    echo "You entered: $user_input"
done
# Explanation:
# - Continuously prompts the user for input.
# - Exits the loop when the user types 'exit'.

# ---------------------------------------------------------------------
# Example 28: Looping with Error Handling
# ---------------------------------------------------------------------
echo -e "\nExample 28: Looping with Error Handling"
files=("file1.txt" "file2.txt" "file3.txt")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "Processing '$file'..."
        # Simulate processing
    else
        echo "Error: '$file' does not exist."
    fi
done
# Explanation:
# - Iterates over a list of files.
# - Checks if each file exists before processing.
# - Handles errors gracefully by notifying the user.

# ---------------------------------------------------------------------
# Example 29: Looping with Delay Using Sleep
# ---------------------------------------------------------------------
echo -e "\nExample 29: Looping with Delay Using Sleep"
for i in {1..3}; do
    echo "Countdown: $i"
    sleep 1
done
echo "Go!"
# Explanation:
# - Iterates from 1 to 3 with a 1-second delay between iterations.
# - Simulates a countdown before executing an action.

# ---------------------------------------------------------------------
# Example 30: Summary and Best Practices
# ---------------------------------------------------------------------
echo -e "\nExample 30: Summary and Best Practices"
echo "------------------------------------------------"
echo "1. Choose the appropriate loop type based on the task:"
echo "   - Use 'for' loops for iterating over lists or sequences."
echo "   - Use 'while' loops for condition-based iterations."
echo "   - Use 'until' loops when you want to loop until a condition is met."
echo "2. Use descriptive variable names to enhance readability."
echo "3. Avoid infinite loops unless intentionally required."
echo "4. Utilize 'break' and 'continue' to control loop flow effectively."
echo "5. Limit the use of nested loops to maintain simplicity."
echo "6. Handle loop outputs appropriately, either by redirecting or processing them."
echo "7. Incorporate error handling within loops to manage unexpected scenarios."
echo "8. Use arrays and indexes for more complex data handling within loops."
echo "9. Leverage loop labels for controlling nested loops when necessary."
echo "10. Regularly review and refactor loops to optimize performance and readability."
# Explanation:
# - Summarizes key points and best practices for using loops in Bash.
# - Reinforces the importance of choosing the right loop type and writing clean, maintainable code.

# =====================================================================
# End of Script
# =====================================================================

