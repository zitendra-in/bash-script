#!/bin/bash

# =====================================================================
# Script Name: print_message.sh
# Description: Demonstrates various usages of the 'echo' command in Bash.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# The 'echo' command in Bash is used to display messages, variables, and 
# formatted text to the terminal. It supports various options and escape 
# sequences to control the output format. This script showcases different 
# ways to use the 'echo' command, including handling newlines, tabs, 
# special characters, variables, and combining text with variables.
# =====================================================================

echo "Demonstrating various 'echo' command examples in Bash."
echo "--------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Echo without any options
# Displays a simple message with a newline at the end.
# ---------------------------------------------------------------------
echo -e "\nExample 1: Echo without any options"
echo "Hello, World!"

# ---------------------------------------------------------------------
# Example 2: Echo with a newline (default behavior)
# Prints a message followed by a newline, which is the default behavior of 'echo'.
# ---------------------------------------------------------------------
echo -e "\nExample 2: Echo with a newline (default behavior)"
echo "This is a simple message with a newline."

# ---------------------------------------------------------------------
# Example 3: Echo without newline (using the -n option)
# Prints a message without appending a newline at the end.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Echo without newline (using the -n option)"
echo -n "This message has no newline at the end."

# ---------------------------------------------------------------------
# Example 4: Echo with a tab (using escape sequences)
# Utilizes the -e option to interpret escape sequences like \t for tabs.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Echo with a tab (using escape sequences)"
echo -e "Here is a\ttabbed message."

# ---------------------------------------------------------------------
# Example 5: Echo with newlines (using escape sequences)
# Demonstrates how to print multiple lines using \n escape sequence.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Echo with newlines (using escape sequences)"
echo -e "Line 1\nLine 2\nLine 3"

# ---------------------------------------------------------------------
# Example 6: Echo with a carriage return (using escape sequences)
# Shows how a carriage return can overwrite the current line.
# ---------------------------------------------------------------------
echo -e "\nExample 6: Echo with a carriage return (using escape sequences)"
echo -e "First line\rOverwritten"

# ---------------------------------------------------------------------
# Example 7: Echo with a backspace (using escape sequences)
# Demonstrates the use of backspace character to remove characters.
# ---------------------------------------------------------------------
echo -e "\nExample 7: Echo with a backspace (using escape sequences)"
echo -e "Hello, \bWorld!"

# ---------------------------------------------------------------------
# Example 8: Echo with special characters using the -e flag
# Prints special characters like backslash and double quotes.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Echo with special characters using the -e flag"
echo -e "Here is a backslash: \\ and a double quote: \""

# ---------------------------------------------------------------------
# Example 9: Echo with a variable
# Assigns a value to a variable and prints it using echo.
# ---------------------------------------------------------------------
echo -e "\nExample 9: Echo with a variable"
name="John"
echo "Hello, $name!"

# ---------------------------------------------------------------------
# Example 10: Combining variables and text
# Combines variables with text and performs arithmetic operations within echo.
# ---------------------------------------------------------------------
echo -e "\nExample 10: Combining variables and text"
echo "Hello, $name! You have $((5+3)) new messages."

# ---------------------------------------------------------------------
# Example 11: Echo with a long message across multiple lines
# Uses escape sequences to print a long message spanning multiple lines.
# ---------------------------------------------------------------------
echo -e "\nExample 11: Echo with a long message across multiple lines"
echo -e "This is a very long message\nwhich spans across multiple lines.\nIt will display as separate lines when using -e flag with echo."

# =====================================================================
# End of Script
# =====================================================================
