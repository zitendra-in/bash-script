#!/bin/bash

# =====================================================================
# Script Name: print_colour_message.sh
# Description: Demonstrates various color codes and text formatting 
#              using the 'echo' command in Bash.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# The escape sequence to print colored text in Bash is `\e[<code>m`.
# The `<code>` corresponds to various colors and effects such as:
#   - Text color codes: 30-37 (for standard colors), 90-97 (for bright colors)
#   - Background color codes: 40-47 (for standard background colors), 
#     100-107 (for bright background colors)
#   - Formatting codes: 
#       1 (Bold), 2 (Dim), 4 (Underline), 
#       5 (Blink), 7 (Reverse), 8 (Hidden)
#
# Each color or effect code is used in an escape sequence in the form: \e[<code>m
# After the desired color code, reset the color using \e[0m to return to 
# the default formatting.
# The general structure for using escape sequences is:
#   \e[<code>m<your_text>\e[0m
# Where \e[0m resets the terminal formatting back to the default.
# =====================================================================

echo "Demonstrating various color codes and text formatting using 'echo' in Bash."
echo "--------------------------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Text Color Codes (Foreground colors) :: 30
# Displays text in standard colors using color codes 30-37.
# ---------------------------------------------------------------------
echo -e "\nExample 1: Text Color Codes (Foreground colors)"
echo -e "\e[30mThis is black text\e[0m"    # Black text
echo -e "\e[31mThis is red text\e[0m"      # Red text
echo -e "\e[32mThis is green text\e[0m"    # Green text
echo -e "\e[33mThis is yellow text\e[0m"   # Yellow text
echo -e "\e[34mThis is blue text\e[0m"     # Blue text
echo -e "\e[35mThis is magenta text\e[0m"  # Magenta text
echo -e "\e[36mThis is cyan text\e[0m"     # Cyan text
echo -e "\e[37mThis is white text\e[0m"    # White text

# ---------------------------------------------------------------------
# Example 2: Bright Text Color Codes (Foreground colors) :: 30+60=90
# Displays text in bright colors using color codes 90-97.
# ---------------------------------------------------------------------
echo -e "\nExample 2: Bright Text Color Codes (Foreground colors)"
echo -e "\e[90mThis is bright black text (gray)\e[0m"  # Bright black (gray) text
echo -e "\e[91mThis is bright red text\e[0m"          # Bright red text
echo -e "\e[92mThis is bright green text\e[0m"        # Bright green text
echo -e "\e[93mThis is bright yellow text\e[0m"       # Bright yellow text
echo -e "\e[94mThis is bright blue text\e[0m"         # Bright blue text
echo -e "\e[95mThis is bright magenta text\e[0m"      # Bright magenta text
echo -e "\e[96mThis is bright cyan text\e[0m"         # Bright cyan text
echo -e "\e[97mThis is bright white text\e[0m"        # Bright white text

# ---------------------------------------------------------------------
# Example 3: Background Color Codes :: 40
# Displays text with background colors using color codes 40-47.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Background Color Codes (Standard backgrounds)"
echo -e "\e[40mThis is black background\e[0m"      # Black background
echo -e "\e[41mThis is red background\e[0m"        # Red background
echo -e "\e[42mThis is green background\e[0m"      # Green background
echo -e "\e[43mThis is yellow background\e[0m"     # Yellow background
echo -e "\e[44mThis is blue background\e[0m"       # Blue background
echo -e "\e[45mThis is magenta background\e[0m"    # Magenta background
echo -e "\e[46mThis is cyan background\e[0m"       # Cyan background
echo -e "\e[47mThis is white background\e[0m"      # White background

# ---------------------------------------------------------------------
# Example 4: Bright Background Color Codes :: 40+60=100
# Displays text with bright background colors using color codes 100-107.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Bright Background Color Codes (Bright backgrounds)"
echo -e "\e[100mThis is bright black (gray) background\e[0m"  # Bright black background
echo -e "\e[101mThis is bright red background\e[0m"            # Bright red background
echo -e "\e[102mThis is bright green background\e[0m"          # Bright green background
echo -e "\e[103mThis is bright yellow background\e[0m"         # Bright yellow background
echo -e "\e[104mThis is bright blue background\e[0m"           # Bright blue background
echo -e "\e[105mThis is bright magenta background\e[0m"        # Bright magenta background
echo -e "\e[106mThis is bright cyan background\e[0m"           # Bright cyan background
echo -e "\e[107mThis is bright white background\e[0m"          # Bright white background

# ---------------------------------------------------------------------
# Example 5: Text Formatting Codes :: 1
# Demonstrates various text formatting options like bold, dim, underline, etc.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Text Formatting Codes"
echo -e "\e[1mThis is bold text\e[0m"         # Bold text
echo -e "\e[2mThis is dim text\e[0m"          # Dim (less bright) text
echo -e "\e[4mThis is underlined text\e[0m"    # Underlined text
echo -e "\e[7mThis is reversed text\e[0m"      # Reversed colors (foreground and background swapped)
echo -e "\e[5mThis is blinking text\e[0m"      # Blinking text (not supported by all terminals)
echo -e "\e[8mThis is hidden text\e[0m"        # Hidden text (text is invisible)

# ---------------------------------------------------------------------
# Example 6: Combining Foreground and Background Colors :: 30,40
# Demonstrates how to combine foreground and background colors in a single echo command.
# ---------------------------------------------------------------------
echo -e "\nExample 6: Combining Foreground and Background Colors"
echo -e "\e[31;47mThis is red text on a white background\e[0m"    # Red text on white background
echo -e "\e[32;41mThis is green text on a red background\e[0m"    # Green text on red background

# ---------------------------------------------------------------------
# Example 7: Text Formatting with Colors :: 1,30
# Combines text formatting codes with color codes for different effects.
# ---------------------------------------------------------------------
echo -e "\nExample 7: Text Formatting with Colors"
echo -e "\e[1;31mThis is bold red text\e[0m"         # Bold red text
echo -e "\e[4;32mThis is underlined green text\e[0m" # Underlined green text
echo -e "\e[7;33mThis is reversed yellow text\e[0m"   # Reversed yellow text

# ---------------------------------------------------------------------
# Example 8: Resetting Colors and Formats :: 0
# Demonstrates how to reset terminal formatting back to default.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Resetting Colors and Formats"
echo -e "This text is normal, no formatting."
echo -e "\e[31mThis is red text\e[0m and this is normal text."

# =====================================================================
# End of Script
# =====================================================================

