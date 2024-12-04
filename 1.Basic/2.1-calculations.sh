#!/bin/bash

# =====================================================================
# Script Name: calculations.sh
# Description: Demonstrates various calculation methods in Bash, including
#              integer and fractional (floating-point) arithmetic.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Bash, being a command-line shell, provides several ways to perform arithmetic
# operations. However, it primarily supports integer arithmetic natively. For
# fractional or floating-point calculations, external tools like `bc` or `awk`
# are used.
#
# This script showcases different methods to perform calculations in Bash:
# 
# 1. **Integer Arithmetic:**
#    - Using Arithmetic Expansion: `$(( ))`
#    - Using the `let` Command
#    - Using the `expr` Command
#
# 2. **Floating-Point Arithmetic:**
#    - Using the `bc` Command-Line Calculator
#    - Using `awk` for Advanced Calculations
#
# Each example includes detailed explanations and demonstrates the syntax and
# usage of the respective method.
# =====================================================================

echo "Demonstrating various calculation methods in Bash."
echo "--------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Integer Arithmetic Using Arithmetic Expansion ($(( )))
# Demonstrates basic integer operations: addition, subtraction, multiplication,
# division, and modulus.
# ---------------------------------------------------------------------
echo -e "\nExample 1: Integer Arithmetic Using Arithmetic Expansion (\$(( )))"

# Declaring integer variables
num1=20
num2=5

# Performing arithmetic operations
sum=$((num1 + num2))
difference=$((num1 - num2))
product=$((num1 * num2))
quotient=$((num1 / num2))
modulus=$((num1 % num2))

# Displaying the results
echo "Numbers: num1=$num1, num2=$num2"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Modulus: $modulus"

# ---------------------------------------------------------------------
# Example 2: Integer Arithmetic Using the 'let' Command
# Demonstrates how to perform arithmetic operations using the `let` command.
# ---------------------------------------------------------------------
echo -e "\nExample 2: Integer Arithmetic Using the 'let' Command"

# Initializing variables
let a=15
let b=4

# Performing arithmetic operations
let sum=a+b
let difference=a-b
let product=a*b
let quotient=a/b
let modulus=a%b

# Displaying the results
echo "Numbers: a=$a, b=$b"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Modulus: $modulus"

# ---------------------------------------------------------------------
# Example 3: Integer Arithmetic Using the 'expr' Command
# Demonstrates how to perform arithmetic operations using the `expr` command.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Integer Arithmetic Using the 'expr' Command"

# Initializing variables
x=25
y=7

# Performing arithmetic operations
sum=$(expr $x + $y)
difference=$(expr $x - $y)
product=$(expr $x \* $y)  # Note: '*' is escaped to prevent shell expansion
quotient=$(expr $x / $y)
modulus=$(expr $x % $y)

# Displaying the results
echo "Numbers: x=$x, y=$y"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Modulus: $modulus"

# ---------------------------------------------------------------------
# Example 4: Floating-Point Arithmetic Using 'bc'
# Demonstrates how to perform fractional calculations using the `bc` command.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Floating-Point Arithmetic Using 'bc'"

# Declaring floating-point variables
num1=5.5
num2=2.2

# Performing arithmetic operations with bc
sum=$(echo "$num1 + $num2" | bc)
difference=$(echo "$num1 - $num2" | bc)
product=$(echo "$num1 * $num2" | bc)
quotient=$(echo "scale=2; $num1 / $num2" | bc)  # 'scale' sets decimal precision

# Displaying the results
echo "Numbers: num1=$num1, num2=$num2"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"

# ---------------------------------------------------------------------
# Example 5: Floating-Point Arithmetic Using 'awk'
# Demonstrates how to perform advanced fractional calculations using `awk`.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Floating-Point Arithmetic Using 'awk'"

# Declaring variables
a=12.75
b=3.5

# Performing arithmetic operations with awk
sum=$(awk "BEGIN {print $a + $b}")
difference=$(awk "BEGIN {print $a - $b}")
product=$(awk "BEGIN {print $a * $b}")
quotient=$(awk "BEGIN {printf \"%.2f\", $a / $b}")  # Formatting output

# Displaying the results
echo "Numbers: a=$a, b=$b"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"

# ---------------------------------------------------------------------
# Example 6: Incrementing and Decrementing Variables
# Demonstrates how to increment and decrement variable values.
# ---------------------------------------------------------------------
echo -e "\nExample 6: Incrementing and Decrementing Variables"

# Initializing variable
counter=10
echo "Initial Counter: $counter"

# Incrementing the counter
counter=$((counter + 1))
echo "After Increment: $counter"

# Decrementing the counter
counter=$((counter - 1))
echo "After Decrement: $counter"

# ---------------------------------------------------------------------
# Example 7: Compound Arithmetic Operations
# Demonstrates performing multiple arithmetic operations in a single step.
# ---------------------------------------------------------------------
echo -e "\nExample 7: Compound Arithmetic Operations"

# Initializing variables
m=8
n=3

# Performing compound operations
result=$(( (m + n) * (m - n) ))  # (8 + 3) * (8 - 3) = 11 * 5 = 55
echo "Calculation: (m + n) * (m - n) = $result"

# ---------------------------------------------------------------------
# Example 8: Using Variables in Command Substitution
# Demonstrates how to use variables within command substitution for calculations.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Using Variables in Command Substitution"

# Initializing variables
length=15
width=10

# Calculating area and perimeter using command substitution
area=$(echo "$length * $width" | bc)
perimeter=$(echo "2 * ($length + $width)" | bc)

# Displaying the results
echo "Rectangle Dimensions: Length=$length, Width=$width"
echo "Area: $area"
echo "Perimeter: $perimeter"

# ---------------------------------------------------------------------
# Example 9: Handling Division by Zero
# Demonstrates error handling when performing division by zero.
# ---------------------------------------------------------------------
echo -e "\nExample 9: Handling Division by Zero"

# Initializing variables
num=10
den=0

# Attempting division
if [ "$den" -ne 0 ]; then
    result=$((num / den))
    echo "Result: $result"
else
    echo "Error: Division by zero is undefined."
fi

# ---------------------------------------------------------------------
# Example 10: Using Read-Only Variables in Calculations
# Demonstrates how read-only variables can be used in arithmetic operations.
# ---------------------------------------------------------------------
echo -e "\nExample 10: Using Read-Only Variables in Calculations"

# Declaring a read-only variable
readonly PI=3.14159
echo "Value of PI: $PI"

# Performing calculations with the read-only variable
radius=5
area=$(echo "scale=2; $PI * $radius * $radius" | bc)
echo "Area of a circle with radius $radius: $area"

# ---------------------------------------------------------------------
# Example 11: Floating-Point Precision with 'bc'
# Demonstrates setting precision for floating-point calculations.
# ---------------------------------------------------------------------
echo -e "\nExample 11: Floating-Point Precision with 'bc'"

# Declaring variables
x=7.333
y=2.111

# Performing calculations with specified precision
sum=$(echo "scale=4; $x + $y" | bc)
difference=$(echo "scale=4; $x - $y" | bc)
product=$(echo "scale=4; $x * $y" | bc)
quotient=$(echo "scale=4; $x / $y" | bc)

# Displaying the results
echo "Numbers: x=$x, y=$y"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"

# ---------------------------------------------------------------------
# Example 12: Using Variables in Conditional Arithmetic
# Demonstrates how to use arithmetic expressions within conditional statements.
# ---------------------------------------------------------------------
echo -e "\nExample 12: Using Variables in Conditional Arithmetic"

# Initializing variables
score=85

# Conditional check using arithmetic comparison
if (( score >= 90 )); then
    echo "Grade: A"
elif (( score >= 80 )); then
    echo "Grade: B"
elif (( score >= 70 )); then
    echo "Grade: C"
else
    echo "Grade: F"
fi

# ---------------------------------------------------------------------
# Example 13: Arithmetic Operations with Negative Numbers
# Demonstrates handling negative numbers in arithmetic calculations.
# ---------------------------------------------------------------------
echo -e "\nExample 13: Arithmetic Operations with Negative Numbers"

# Declaring variables
a=-10
b=5

# Performing arithmetic operations
sum=$((a + b))
difference=$((a - b))
product=$((a * b))
quotient=$((a / b))
modulus=$((a % b))

# Displaying the results
echo "Numbers: a=$a, b=$b"
echo "Sum: $sum"
echo "Difference: $difference"
echo "Product: $product"
echo "Quotient: $quotient"
echo "Modulus: $modulus"

# ---------------------------------------------------------------------
# Example 14: Using Double Parentheses for Arithmetic Evaluation
# Demonstrates advanced arithmetic evaluation using double parentheses.
# ---------------------------------------------------------------------
echo -e "\nExample 14: Using Double Parentheses for Arithmetic Evaluation"

# Initializing variables
counter=1

# Using double parentheses for arithmetic operations and increment
((counter++))
echo "Counter after increment: $counter"

((counter += 5))
echo "Counter after adding 5: $counter"

((counter *= 2))
echo "Counter after multiplication by 2: $counter"

# ---------------------------------------------------------------------
# Example 15: Combining Arithmetic Operations and Variable Substitution
# Demonstrates combining multiple arithmetic operations with variable substitution.
# ---------------------------------------------------------------------
echo -e "\nExample 15: Combining Arithmetic Operations and Variable Substitution"

# Declaring variables
base=4
height=3

# Calculating area of a triangle
area=$(echo "scale=2; 0.5 * $base * $height" | bc)
echo "Area of a triangle with base $base and height $height: $area"

# Calculating the hypotenuse using Pythagorean theorem
hypotenuse=$(awk "BEGIN {print sqrt($base*$base + $height*$height)}")
echo "Hypotenuse of a right-angled triangle: $hypotenuse"

# =====================================================================
# End of Script
# =====================================================================

