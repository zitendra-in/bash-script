#!/bin/bash

# =====================================================================
# Script Name: conditionals_comprehensive.sh
# Description: Demonstrates various test conditions in Bash, including
#              integer comparisons, floating number comparisons, string
#              comparisons, logical operators, and file comparisons.
#              Each section provides detailed explanations and examples.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Test conditions are fundamental in Bash scripting, allowing scripts
# to make decisions based on the evaluation of specific criteria.
# Understanding how to effectively use test conditions is crucial for
# writing robust and flexible scripts.
#
# **Key Concepts:**
#
# 1. **Integer Comparisons:**
#    - Used to compare numerical values.
#    - Common operators:
#      - `-eq`: Equal to
#      - `-ne`: Not equal to
#      - `-lt`: Less than
#      - `-le`: Less than or equal to
#      - `-gt`: Greater than
#      - `-ge`: Greater than or equal to
#
# 2. **Floating Number Comparisons:**
#    - Bash does not support floating-point arithmetic natively.
#    - Use external tools like `bc` or `awk`.
#    - Operators similar to integer comparisons can be used with `bc`.
#
# 3. **String Comparisons:**
#    - Used to compare string values.
#    - Common operators:
#      - `=`: Equal to
#      - `==`: Equal to (in `[[ ]]`)
#      - `!=`: Not equal to
#      - `<`: Less than (lexicographical)
#      - `>`: Greater than (lexicographical)
#      - `-z`: String has zero length
#      - `-n`: String has non-zero length
#
# 4. **Logical Operators:**
#    - Combine multiple conditions.
#    - `&&`: Logical AND
#    - `||`: Logical OR
#    - `!`: Logical NOT
#
# 5. **File Comparisons:**
#    - Check various file attributes.
#    - Common operators:
#      - `-e`: Exists
#      - `-f`: Regular file
#      - `-d`: Directory
#      - `-r`: Readable
#      - `-w`: Writable
#      - `-x`: Executable
#
# **Bracket and Parentheses Usage:**
#
# - `[ ]`: Single square brackets for basic test conditions.
# - `[[ ]]`: Double square brackets for enhanced test conditions.
# - `(( ))`: Double parentheses for arithmetic evaluation.
# - `( )`: Single parentheses for subshells.
# - `{ }`: Single braces for grouping commands.
# - `{{ }}`: Not standard in Bash; typically used in templating languages.
#
# **Comparison Operators:**
#
# - **Integer Comparisons:**
#   - `-eq`, `-ne`, `-lt`, `-le`, `-gt`, `-ge`
# - **String Comparisons:**
#   - `=`, `==`, `!=`, `<`, `>`
# - **Arithmetic Comparisons:**
#   - `>`, `<`, `>=`, `<=`, `==`, `!=` (used within `(( ))` or `[[ ]]`)
#
# **Best Practices:**
#
# - **Quoting Variables:** Always quote variables in `[ ]` to prevent word splitting.
# - **Use `[[ ]]` Over `[ ]`:** Prefer double brackets for safer and more powerful string comparisons.
# - **Arithmetic with `(( ))`:** Use double parentheses for arithmetic operations without needing `$`.
# - **Logical Operators:** Use `&&` and `||` to combine conditions effectively.
# - **File Tests:** Utilize appropriate file test operators to check file attributes.
# - **Avoid `{{ }}`:** Do not use double braces in standard Bash scripts as they are not recognized.
#
# This script provides comprehensive examples covering these aspects,
# demonstrating how to effectively implement and manage conditional
# statements in various scenarios.
# =====================================================================

echo "Demonstrating various test conditions in Bash."
echo "------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Integer Comparison - Equal To (-eq)
# ---------------------------------------------------------------------
echo -e "\nExample 1: Integer Comparison - Equal To (-eq)"
echo "Enter a number:"
read num1

if [ "$num1" -eq 10 ]; then
    echo "The number is equal to 10."
else
    echo "The number is not equal to 10."
fi
# Explanation:
# - `-eq` checks if num1 is equal to 10.
# - Single brackets [ ] are used for the test condition.
# - Variables are quoted to prevent word splitting.

# ---------------------------------------------------------------------
# Example 2: Integer Comparison - Not Equal To (-ne)
# ---------------------------------------------------------------------
echo -e "\nExample 2: Integer Comparison - Not Equal To (-ne)"
echo "Enter a number:"
read num2

if [ "$num2" -ne 5 ]; then
    echo "The number is not equal to 5."
else
    echo "The number is equal to 5."
fi
# Explanation:
# - `-ne` checks if num2 is not equal to 5.

# ---------------------------------------------------------------------
# Example 3: Integer Comparison - Less Than (-lt)
# ---------------------------------------------------------------------
echo -e "\nExample 3: Integer Comparison - Less Than (-lt)"
echo "Enter a number:"
read num3

if [ "$num3" -lt 20 ]; then
    echo "The number is less than 20."
else
    echo "The number is not less than 20."
fi
# Explanation:
# - `-lt` checks if num3 is less than 20.

# ---------------------------------------------------------------------
# Example 4: Integer Comparison - Less Than or Equal To (-le)
# ---------------------------------------------------------------------
echo -e "\nExample 4: Integer Comparison - Less Than or Equal To (-le)"
echo "Enter a number:"
read num4

if [ "$num4" -le 15 ]; then
    echo "The number is less than or equal to 15."
else
    echo "The number is greater than 15."
fi
# Explanation:
# - `-le` checks if num4 is less than or equal to 15.

# ---------------------------------------------------------------------
# Example 5: Integer Comparison - Greater Than (-gt)
# ---------------------------------------------------------------------
echo -e "\nExample 5: Integer Comparison - Greater Than (-gt)"
echo "Enter a number:"
read num5

if [ "$num5" -gt 8 ]; then
    echo "The number is greater than 8."
else
    echo "The number is not greater than 8."
fi
# Explanation:
# - `-gt` checks if num5 is greater than 8.

# ---------------------------------------------------------------------
# Example 6: Integer Comparison - Greater Than or Equal To (-ge)
# ---------------------------------------------------------------------
echo -e "\nExample 6: Integer Comparison - Greater Than or Equal To (-ge)"
echo "Enter a number:"
read num6

if [ "$num6" -ge 12 ]; then
    echo "The number is greater than or equal to 12."
else
    echo "The number is less than 12."
fi
# Explanation:
# - `-ge` checks if num6 is greater than or equal to 12.

# ---------------------------------------------------------------------
# Example 7: Floating Number Comparison using bc
# ---------------------------------------------------------------------
echo -e "\nExample 7: Floating Number Comparison using bc"
echo "Enter the first floating number:"
read float1
echo "Enter the second floating number:"
read float2

# Using bc for floating-point comparison
comparison=$(echo "$float1 > $float2" | bc -l)
if [ "$comparison" -eq 1 ]; then
    echo "$float1 is greater than $float2."
else
    comparison=$(echo "$float1 == $float2" | bc -l)
    if [ "$comparison" -eq 1 ]; then
        echo "$float1 is equal to $float2."
    else
        echo "$float1 is less than $float2."
    fi
fi
# Explanation:
# - `bc -l` is used for floating-point arithmetic.
# - The result of the comparison is captured and evaluated.

# ---------------------------------------------------------------------
# Example 8: String Comparison - Equal To (=)
# ---------------------------------------------------------------------
echo -e "\nExample 8: String Comparison - Equal To (=)"
echo "Enter a string:"
read str1

if [ "$str1" = "Bash" ]; then
    echo "You entered Bash."
else
    echo "You did not enter Bash."
fi
# Explanation:
# - `=` checks if str1 is exactly "Bash".
# - Single brackets [ ] are used for the test condition.

# ---------------------------------------------------------------------
# Example 9: String Comparison - Equal To (==) using [[ ]]
# ---------------------------------------------------------------------
echo -e "\nExample 9: String Comparison - Equal To (==) using [[ ]]"
echo "Enter a string:"
read str2

if [[ "$str2" == "Python" ]]; then
    echo "You entered Python."
else
    echo "You did not enter Python."
fi
# Explanation:
# - `==` checks if str2 is exactly "Python".
# - Double brackets [[ ]] provide enhanced test capabilities.

# ---------------------------------------------------------------------
# Example 10: String Comparison - Not Equal To (!=)
# ---------------------------------------------------------------------
echo -e "\nExample 10: String Comparison - Not Equal To (!=)"
echo "Enter a string:"
read str3

if [ "$str3" != "Ruby" ]; then
    echo "You did not enter Ruby."
else
    echo "You entered Ruby."
fi
# Explanation:
# - `!=` checks if str3 is not equal to "Ruby".

# ---------------------------------------------------------------------
# Example 11: String Comparison - Less Than (<) Lexicographical
# ---------------------------------------------------------------------
echo -e "\nExample 11: String Comparison - Less Than (<) Lexicographical"
echo "Enter your favorite fruit:"
read fruit1
echo "Enter another favorite fruit:"
read fruit2

if [[ "$fruit1" < "$fruit2" ]]; then
    echo "$fruit1 comes before $fruit2 lexicographically."
else
    echo "$fruit1 does not come before $fruit2 lexicographically."
fi
# Explanation:
# - `<` compares strings lexicographically.
# - Must be used within double brackets [[ ]].

# ---------------------------------------------------------------------
# Example 12: String Comparison - Greater Than (>) Lexicographical
# ---------------------------------------------------------------------
echo -e "\nExample 12: String Comparison - Greater Than (>) Lexicographical"
echo "Enter your favorite animal:"
read animal1
echo "Enter another favorite animal:"
read animal2

if [[ "$animal1" > "$animal2" ]]; then
    echo "$animal1 comes after $animal2 lexicographically."
else
    echo "$animal1 does not come after $animal2 lexicographically."
fi
# Explanation:
# - `>` compares strings lexicographically.
# - Must be used within double brackets [[ ]].

# ---------------------------------------------------------------------
# Example 13: String Length Check - Zero Length (-z)
# ---------------------------------------------------------------------
echo -e "\nExample 13: String Length Check - Zero Length (-z)"
echo "Enter a string (leave empty to test):"
read str4

if [ -z "$str4" ]; then
    echo "You entered an empty string."
else
    echo "You entered: $str4"
fi
# Explanation:
# - `-z` checks if str4 has zero length (is empty).

# ---------------------------------------------------------------------
# Example 14: String Length Check - Non-Zero Length (-n)
# ---------------------------------------------------------------------
echo -e "\nExample 14: String Length Check - Non-Zero Length (-n)"
echo "Enter a string (leave empty to test):"
read str5

if [ -n "$str5" ]; then
    echo "You entered a non-empty string: $str5"
else
    echo "You entered an empty string."
fi
# Explanation:
# - `-n` checks if str5 has a non-zero length (is not empty).

# ---------------------------------------------------------------------
# Example 15: Logical AND (&&) Operator with Integer Comparisons
# ---------------------------------------------------------------------
echo -e "\nExample 15: Logical AND (&&) Operator with Integer Comparisons"
echo "Enter two numbers:"
read num7
read num8

if [ "$num7" -gt 0 ] && [ "$num8" -gt 0 ]; then
    echo "Both numbers are positive."
else
    echo "At least one of the numbers is not positive."
fi
# Explanation:
# - `&&` combines two conditions.
# - Both conditions must be true for the overall condition to be true.

# ---------------------------------------------------------------------
# Example 16: Logical OR (||) Operator with String Comparisons
# ---------------------------------------------------------------------
echo -e "\nExample 16: Logical OR (||) Operator with String Comparisons"
echo "Enter your favorite programming language:"
read lang1
echo "Enter another favorite programming language:"
read lang2

if [ "$lang1" = "JavaScript" ] || [ "$lang2" = "JavaScript" ]; then
    echo "At least one of your favorite languages is JavaScript."
else
    echo "JavaScript is not among your favorite languages."
fi
# Explanation:
# - `||` combines two conditions.
# - At least one condition must be true for the overall condition to be true.

# ---------------------------------------------------------------------
# Example 17: Logical NOT (!) Operator
# ---------------------------------------------------------------------
echo -e "\nExample 17: Logical NOT (!) Operator"
echo "Enter a number:"
read num9

if ! [ "$num9" -gt 100 ]; then
    echo "The number is not greater than 100."
else
    echo "The number is greater than 100."
fi
# Explanation:
# - `!` negates the condition.
# - Checks if num9 is not greater than 100.

# ---------------------------------------------------------------------
# Example 18: Floating Number Greater Than or Equal To
# ---------------------------------------------------------------------
echo -e "\nExample 18: Floating Number Greater Than or Equal To"
echo "Enter a floating number:"
read float3

if (( $(echo "$float3 >= 3.14" | bc -l) )); then
    echo "$float3 is greater than or equal to 3.14."
else
    echo "$float3 is less than 3.14."
fi
# Explanation:
# - Uses `bc -l` for floating-point arithmetic.
# - Evaluates if float3 is greater than or equal to 3.14.

# ---------------------------------------------------------------------
# Example 19: File Existence Check (-e)
# ---------------------------------------------------------------------
echo -e "\nExample 19: File Existence Check (-e)"
echo "Enter the path to a file:"
read file1

if [ -e "$file1" ]; then
    echo "File '$file1' exists."
else
    echo "File '$file1' does not exist."
fi
# Explanation:
# - `-e` checks if the file exists.

# ---------------------------------------------------------------------
# Example 20: Regular File Check (-f)
# ---------------------------------------------------------------------
echo -e "\nExample 20: Regular File Check (-f)"
echo "Enter the path to a file:"
read file2

if [ -f "$file2" ]; then
    echo "'$file2' is a regular file."
else
    echo "'$file2' is not a regular file."
fi
# Explanation:
# - `-f` checks if the file is a regular file.

# ---------------------------------------------------------------------
# Example 21: Directory Check (-d)
# ---------------------------------------------------------------------
echo -e "\nExample 21: Directory Check (-d)"
echo "Enter the path to a directory:"
read dir1

if [ -d "$dir1" ]; then
    echo "'$dir1' is a directory."
else
    echo "'$dir1' is not a directory."
fi
# Explanation:
# - `-d` checks if the path is a directory.

# ---------------------------------------------------------------------
# Example 22: Readable File Check (-r)
# ---------------------------------------------------------------------
echo -e "\nExample 22: Readable File Check (-r)"
echo "Enter the path to a file:"
read file3

if [ -r "$file3" ]; then
    echo "File '$file3' is readable."
else
    echo "File '$file3' is not readable."
fi
# Explanation:
# - `-r` checks if the file is readable.

# ---------------------------------------------------------------------
# Example 23: Writable File Check (-w)
# ---------------------------------------------------------------------
echo -e "\nExample 23: Writable File Check (-w)"
echo "Enter the path to a file:"
read file4

if [ -w "$file4" ]; then
    echo "File '$file4' is writable."
else
    echo "File '$file4' is not writable."
fi
# Explanation:
# - `-w` checks if the file is writable.

# ---------------------------------------------------------------------
# Example 24: Executable File Check (-x)
# ---------------------------------------------------------------------
echo -e "\nExample 24: Executable File Check (-x)"
echo "Enter the path to a file:"
read file5

if [ -x "$file5" ]; then
    echo "File '$file5' is executable."
else
    echo "File '$file5' is not executable."
fi
# Explanation:
# - `-x` checks if the file is executable.

# ---------------------------------------------------------------------
# Example 25: Combined File Attribute Checks with Logical AND (&&)
# ---------------------------------------------------------------------
echo -e "\nExample 25: Combined File Attribute Checks with Logical AND (&&)"
echo "Enter the path to a file:"
read file6

if [ -e "$file6" ] && [ -f "$file6" ] && [ -r "$file6" ]; then
    echo "File '$file6' exists, is a regular file, and is readable."
else
    echo "File '$file6' does not meet all the specified attributes."
fi
# Explanation:
# - Combines multiple file tests using logical AND `&&`.
# - Checks for existence, regular file type, and readability.

# ---------------------------------------------------------------------
# Example 26: String Pattern Matching with [[ ]]
# ---------------------------------------------------------------------
echo -e "\nExample 26: String Pattern Matching with [[ ]]"
echo "Enter your email address:"
read email

if [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
    echo "Valid email format."
else
    echo "Invalid email format."
fi
# Explanation:
# - Uses regex to validate email format.
# - `=~` operator within double brackets allows regex matching.

# ---------------------------------------------------------------------
# Example 27: Arithmetic Evaluation with (( ))
# ---------------------------------------------------------------------
echo -e "\nExample 27: Arithmetic Evaluation with (( ))"
echo "Enter two numbers to calculate their sum and product:"
read a
read b

(( sum = a + b ))
(( product = a * b ))

echo "The sum of $a and $b is $sum."
echo "The product of $a and $b is $product."
# Explanation:
# - `(( ))` is used for arithmetic evaluation.
# - Variables inside (( )) do not need a `$` prefix.
# - Supports standard arithmetic operations.

# ---------------------------------------------------------------------
# Example 28: Grouping Commands with { }
# ---------------------------------------------------------------------
echo -e "\nExample 28: Grouping Commands with { }"
echo "Executing grouped commands:"
{
    echo "Listing current directory contents:"
    ls -l
    echo "Displaying current date and time:"
    date
}
# Explanation:
# - Curly braces { } group commands to run in the current shell.
# - Commands are separated by semicolons or newlines.
# - Useful for redirection and executing multiple commands together.

# ---------------------------------------------------------------------
# Example 29: Subshell Execution with ( )
# ---------------------------------------------------------------------
echo -e "\nExample 29: Subshell Execution with ( )"
echo "Changing directory to /tmp in a subshell and listing contents:"
(
    cd /tmp
    ls
)
echo "Back to the original directory: $(pwd)"
# Explanation:
# - Parentheses ( ) create a subshell.
# - Changes inside subshell do not affect the parent shell.
# - Useful for temporary environment changes.

# ---------------------------------------------------------------------
# Example 30: Summary and Best Practices
# ---------------------------------------------------------------------
echo -e "\nExample 30: Summary and Best Practices"
echo "------------------------------------------------"
echo "1. Use [ ] for basic test conditions; always quote variables."
echo "2. Use [[ ]] for advanced tests; supports regex and patterns."
echo "3. Use (( )) for arithmetic evaluations; no $ needed for variables."
echo "4. Use { } to group commands in the current shell."
echo "5. Use ( ) to execute commands in a subshell."
echo "6. Use logical operators && and || to combine conditions."
echo "7. Use case statements for multiple discrete conditions."
echo "8. Avoid using {{ }} as it is not standard in Bash."
echo "9. Always ensure correct spacing and syntax to prevent errors."
echo "10. Prefer double brackets [[ ]] for safer string comparisons."

# =====================================================================
# End of Script
# =====================================================================

