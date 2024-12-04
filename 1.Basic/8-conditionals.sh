#!/bin/bash

# =====================================================================
# Script Name: conditionals.sh
# Description: Demonstrates various conditional statements in Bash, including
#              if-else, nested if-else, if-elif-else, nested if-elif-else,
#              and case statements. It explains which brackets or parentheses
#              to use with different forms of if statements and conditions.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Conditional statements are essential in Bash scripting as they allow scripts
# to make decisions and execute different blocks of code based on specific
# conditions. Understanding the correct syntax and usage of different types
# of brackets and parentheses is crucial for writing effective and error-free
# Bash scripts.
#
# **Conditional Structures and Their Syntaxes:**
#
# 1. **if [ condition ]; then ... fi**
#    - Uses single square brackets [ ].
#    - Traditional test command.
#    - Suitable for basic tests.
#    - Example:
#      ```bash
#      if [ "$var" -eq 10 ]; then
#          echo "Variable is 10."
#      fi
#      ```
#
# 2. **if [[ condition ]]; then ... fi**
#    - Uses double square brackets [[ ]].
#    - Enhanced test command with extended functionality.
#    - Supports pattern matching, logical operators without escaping.
#    - Safer for string comparisons.
#    - Example:
#      ```bash
#      if [[ "$str" == "hello" ]]; then
#          echo "String is hello."
#      fi
#      ```
#
# 3. **if (( condition )); then ... fi**
#    - Uses double parentheses (( )).
#    - Used for arithmetic evaluations.
#    - Allows arithmetic operations without the need for `$` prefix.
#    - Example:
#      ```bash
#      if (( num > 10 )); then
#          echo "Number is greater than 10."
#      fi
#      ```
#
# 4. **if test condition; then ... fi**
#    - Uses the `test` command.
#    - Equivalent to using single square brackets.
#    - Example:
#      ```bash
#      if test "$var" -eq 10; then
#          echo "Variable is 10."
#      fi
#      ```
#
# 5. **if [ condition ]; then ... elif [ condition ]; then ... else ... fi**
#    - Combines multiple conditions using elif and else.
#    - Can be nested for more complex decision-making.
#
# 6. **case variable in pattern) ... ;; esac**
#    - Used for matching a variable against multiple patterns.
#    - Cleaner syntax for multiple discrete conditions.
#
# **Brackets and Parentheses Usage:**
#
# - **[ ] (Single Square Brackets):**
#   - Traditional test command.
#   - Limited functionality.
#   - Requires careful handling of variables and operators.
#
# - **[[ ]] (Double Square Brackets):**
#   - Enhanced test command.
#   - Supports regex, pattern matching.
#   - Does not require variable quoting in some cases.
#   - Safer and more powerful than single brackets.
#
# - **( ) (Single Parentheses):**
#   - Used for subshells.
#   - Commands inside run in a separate process.
#
# - **(( )) (Double Parentheses):**
#   - Arithmetic evaluation.
#   - Useful for mathematical operations.
#
# - **{ } (Single Braces):**
#   - Groups commands in the current shell.
#   - Useful for redirection and code blocks.
#
# **Key Points:**
#
# - **Always quote variables**  "variable" "$var" when using single brackets to prevent word splitting.
# - **Double brackets** [[ ]] are preferred for string comparisons.
# - **Double parentheses** (( )) are used for arithmetic expressions.
# - **Use test command** for compatibility with older shells.
#
# This script provides examples of different conditional statements,
# explaining the correct usage of brackets and parentheses in each case.
# =====================================================================

echo "Demonstrating various conditional statements and bracket usage in Bash."
echo "------------------------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: if [ condition ]; then ... fi
# Demonstrates basic if-else using single square brackets.
# ---------------------------------------------------------------------
echo -e "\nExample 1: Using if [ condition ]"
echo "Enter a number:"
read num

if [ "$num" -gt 10 ]; then
    echo "The number $num is greater than 10."
else
    echo "The number $num is not greater than 10."
fi
# Explanation:
# - Single brackets [ ] are used for the test command.
# - Variables are quoted to prevent word splitting.
# - Suitable for simple integer comparisons.

# ---------------------------------------------------------------------
# Example 2: if [[ condition ]]; then ... fi
# Demonstrates basic if-else using double square brackets.
# ---------------------------------------------------------------------
echo -e "\nExample 2: Using if [[ condition ]]"
echo "Enter a word:"
read word

if [[ $word == "hello" ]]; then
    echo "You entered hello."
else
    echo "You did not enter hello."
fi
# Explanation:
# - Double brackets [[ ]] provide enhanced test capabilities.
# - No need to quote variables when using == for string comparison.
# - Supports pattern matching and regex.

# ---------------------------------------------------------------------
# Example 3: if (( condition )); then ... fi
# Demonstrates basic if-else using double parentheses for arithmetic.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Using if (( condition ))"
echo "Enter another number:"
read num2

if (( num2 % 2 == 0 )); then
    echo "The number $num2 is even."
else
    echo "The number $num2 is odd."
fi
# Explanation:
# - Double parentheses (( )) are used for arithmetic evaluation.
# - Variables do not need a $ prefix inside (( )).
# - Supports standard arithmetic operations.

# ---------------------------------------------------------------------
# Example 4: if test condition; then ... fi
# Demonstrates basic if-else using the test command.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Using if test condition"
echo "Enter your age:"
read age

if test "$age" -ge 18; then
    echo "You are eligible to vote."
else
    echo "You are not eligible to vote."
fi
# Explanation:
# - `test` is a command equivalent to using single brackets [ ].
# - Variables are quoted.
# - Useful for compatibility with older shells.

# ---------------------------------------------------------------------
# Example 5: Nested if-else using [ ]
# Demonstrates nested if-else statements with single brackets.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Nested if-else with [ ]"
echo "Enter a number between 1 and 100:"
read number

if [ "$number" -ge 1 ] && [ "$number" -le 100 ]; then
    echo "Valid number."
    if [ "$number" -gt 50 ]; then
        echo "Number is greater than 50."
    else
        echo "Number is 50 or less."
    fi
else
    echo "Invalid number."
fi
# Explanation:
# - Nested if-else allows multiple levels of condition checking.
# - Single brackets are used with logical AND (&&).
# - Each condition is enclosed in its own [ ].

# ---------------------------------------------------------------------
# Example 6: if-elif-else using [ ]
# Demonstrates if-elif-else with single brackets.
# ---------------------------------------------------------------------
echo -e "\nExample 6: if-elif-else with [ ]"
echo "Enter a character:"
read char

if [ "$char" == "a" ]; then
    echo "You entered 'a'."
elif [ "$char" == "b" ]; then
    echo "You entered 'b'."
else
    echo "You entered something else."
fi
# Explanation:
# - Single brackets are used for each condition.
# - Variables should be quoted.
# - Suitable for simple string comparisons.

# ---------------------------------------------------------------------
# Example 7: if-elif-else using [[ ]]
# Demonstrates if-elif-else with double brackets.
# ---------------------------------------------------------------------
echo -e "\nExample 7: if-elif-else with [[ ]]"
echo "Enter a filename:"
read filename

if [[ -e $filename ]]; then
    echo "File exists."
elif [[ $filename == *.txt ]]; then
    echo "Filename ends with .txt"
else
    echo "File does not exist and is not a .txt file."
fi
# Explanation:
# - Double brackets allow pattern matching (e.g., *.txt).
# - No need to quote variables when using pattern matching.
# - Supports file tests like -e (exists).

# ---------------------------------------------------------------------
# Example 8: Nested if-elif-else using [[ ]]
# Demonstrates nested if-elif-else with double brackets.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Nested if-elif-else with [[ ]]"
echo "Enter your role (admin/user):"
read role

if [[ $role == "admin" ]]; then
    echo "Admin access granted."
    echo "Enter your admin password:"
    read -s admin_pass
    if [[ $admin_pass == "admin123" ]]; then
        echo "Password accepted."
    else
        echo "Incorrect password."
    fi
elif [[ $role == "user" ]]; then
    echo "User access granted."
else
    echo "Access denied."
fi
# Explanation:
# - Double brackets used for string comparisons.
# - Nested if-else for password checking.
# - No need to quote variables in [[ ]].

# ---------------------------------------------------------------------
# Example 9: Case statement
# Demonstrates using a case statement for multiple conditions.
# ---------------------------------------------------------------------
echo -e "\nExample 9: Using case statement"
echo "Enter your favorite color:"
read color

case $color in
    red)
        echo "You like red."
        ;;
    blue)
        echo "You like blue."
        ;;
    green)
        echo "You like green."
        ;;
    *)
        echo "Unknown color."
        ;;
esac
# Explanation:
# - Case statements match patterns.
# - Cleaner syntax for multiple discrete options.
# - Each pattern ends with a closing parenthesis.

# ---------------------------------------------------------------------
# Example 10: Using { } for grouping commands
# Demonstrates grouping multiple commands.
# ---------------------------------------------------------------------
echo -e "\nExample 10: Using { } for grouping commands"
{
    echo "This is the first command."
    echo "This is the second command."
}
# Explanation:
# - Curly braces { } group commands to run in the current shell.
# - Commands are separated by semicolons or newlines.
# - Useful for redirection.

# ---------------------------------------------------------------------
# Example 11: Using ( ) for subshell
# Demonstrates executing commands in a subshell.
# ---------------------------------------------------------------------
echo -e "\nExample 11: Using ( ) for subshell"
(current_dir=$(pwd)
echo "Current directory inside subshell: $current_dir"
cd /tmp
echo "Changed directory to $(pwd) inside subshell")
echo "Back to original directory: $(pwd)"
# Explanation:
# - Parentheses ( ) create a subshell.
# - Changes inside subshell do not affect the parent shell.
# - Useful for temporary environment changes.

# ---------------------------------------------------------------------
# Example 12: Using (( )) for arithmetic evaluation
# Demonstrates arithmetic operations.
# ---------------------------------------------------------------------
echo -e "\nExample 12: Using (( )) for arithmetic evaluation"
echo "Enter a number to calculate its square:"
read num3

(( square = num3 * num3 ))
echo "The square of $num3 is $square."
# Explanation:
# - Variables inside (( )) do not need $ prefix.
# - Useful for complex arithmetic expressions.
# - Result can be stored in a variable without $.

# ---------------------------------------------------------------------
# Example 13: if [[ ]] with logical operators
# Demonstrates combining conditions.
# ---------------------------------------------------------------------
echo -e "\nExample 13: if [[ ]] with logical operators"
echo "Enter a number between 1 and 50:"
read num4

if [[ $num4 -ge 1 && $num4 -le 50 ]]; then
    echo "Number is within range."
else
    echo "Number is out of range."
fi
# Explanation:
# - Double brackets allow use of && without escaping.
# - Cleaner syntax for combining conditions.
# - No need to quote variables.

# ---------------------------------------------------------------------
# Example 14: if [ ] with logical operators
# Demonstrates combining conditions with single brackets.
# ---------------------------------------------------------------------
echo -e "\nExample 14: if [ ] with logical operators"
echo "Enter a letter:"
read letter

if [ "$letter" == "x" ] || [ "$letter" == "y" ]; then
    echo "Letter is x or y."
else
    echo "Letter is not x or y."
fi
# Explanation:
# - Single brackets require separate [ ] for each condition.
# - Logical operators && and || can be used but need careful syntax.
# - Variables should be quoted.

# ---------------------------------------------------------------------
# Example 15: Using test command with logical operators
# Demonstrates combining conditions using test.
# ---------------------------------------------------------------------
echo -e "\nExample 15: Using test command with logical operators"
echo "Enter a file path:"
read filepath

if test -e "$filepath" -a -r "$filepath"; then
    echo "File exists and is readable."
else
    echo "File does not exist or is not readable."
fi
# Explanation:
# - The test command uses -a for logical AND.
# - Variables are quoted.
# - Compatible with older shells.

# ---------------------------------------------------------------------
# Example 16: Advanced case statement with patterns
# Demonstrates pattern matching in case statements.
# ---------------------------------------------------------------------
echo -e "\nExample 16: Advanced case statement with patterns"
echo "Enter a filename:"
read fname

case $fname in
    *.txt)
        echo "Text file."
        ;;
    *.sh)
        echo "Shell script."
        ;;
    *)
        echo "Unknown file type."
        ;;
esac
# Explanation:
# - Patterns can include wildcards like *.
# - Simplifies file type checking.
# - Each case ends with ;;.

# ---------------------------------------------------------------------
# Example 17: Using double brackets for regex matching
# Demonstrates regex pattern matching.
# ---------------------------------------------------------------------
echo -e "\nExample 17: Using [[ ]] for regex matching"
echo "Enter a string containing numbers:"
read str

if [[ $str =~ ^[0-9]+$ ]]; then
    echo "String contains only numbers."
else
    echo "String contains non-numeric characters."
fi
# Explanation:
# - Double brackets [[ ]] support regex with =~ operator.
# - No need to quote variables.
# - Useful for pattern matching.

# ---------------------------------------------------------------------
# Example 18: Avoiding common errors with brackets
# Demonstrates the importance of spaces and syntax.
# ---------------------------------------------------------------------
echo -e "\nExample 18: Avoiding common errors"
echo "Enter a number (demonstrating syntax errors):"
read num5

# Incorrect: Missing spaces or brackets
# if[$num5 -eq 10];then
#     echo "Number is 10."
# fi

# Correct syntax:
if [ "$num5" -eq 10 ]; then
    echo "Number is 10."
else
    echo "Number is not 10."
fi
# Explanation:
# - Spaces are crucial in [ ] syntax.
# - Missing spaces or brackets lead to syntax errors.
# - Always ensure correct syntax to prevent errors.

# ---------------------------------------------------------------------
# Example 19: Using variables inside arithmetic evaluation
# Demonstrates variable usage in (( )).
# ---------------------------------------------------------------------
echo -e "\nExample 19: Variables inside (( ))"
a=5
b=3
(( sum = a + b ))
echo "Sum of $a and $b is $sum."
# Explanation:
# - Variables inside (( )) do not need $.
# - Arithmetic operations are straightforward.
# - Results can be assigned to variables.

# ---------------------------------------------------------------------
# Example 20: Summary and Best Practices
# Provides a summary of bracket usage and best practices.
# ---------------------------------------------------------------------
echo -e "\nExample 20: Summary and Best Practices"
echo "------------------------------------------------"
echo "Use [ ] for basic test conditions; quote variables."
echo "Use [[ ]] for advanced tests; supports regex and patterns."
echo "Use (( )) for arithmetic evaluations; no $ needed for variables."
echo "Use { } to group commands in the current shell."
echo "Use ( ) to execute commands in a subshell."
echo "Use case statements for multiple discrete conditions."
echo "Always be mindful of spaces and syntax to avoid errors."
# Explanation:
# - Understanding the correct usage of brackets enhances script reliability.
# - Choosing the appropriate syntax simplifies code and reduces errors.
# - Following best practices leads to more maintainable scripts.

# =====================================================================
# End of Script
# =====================================================================

