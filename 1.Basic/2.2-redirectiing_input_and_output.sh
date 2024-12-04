#!/bin/bash

# =====================================================================
# Script Name: redirecting_input_and_output.sh
# Description: Demonstrates various methods of redirecting output in Bash,
#              including stdout, stderr, appending, here-documents, and piping.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Redirection is a powerful feature in Bash that allows you to control where the
# input and output of commands are sent. It enables the manipulation of data streams,
# facilitating tasks such as logging, data processing, and error handling.
#
# This script showcases various redirection operators and techniques:
#
# 1. **Output Redirection:**
#    - `>`  : Redirects standard output (stdout) to a file, overwriting the file.
#    - `>>` : Redirects stdout to a file, appending to the file.
#
# 2. **Input Redirection:**
#    - `<`  : Redirects a file's content to the standard input (stdin) of a command.
#    - `<<` : Here-document; allows you to provide multiline input directly within the script.
#
# 3. **File Descriptor Redirection:**
#    - `1>`  : Explicitly redirects stdout to a file.
#    - `1>>` : Explicitly redirects stdout to a file, appending.
#    - `2>`  : Redirects standard error (stderr) to a file.
#    - `2>>` : Redirects stderr to a file, appending.
#    - `&>`  : Redirects both stdout and stderr to a file, overwriting.
#    - `&>>` : Redirects both stdout and stderr to a file, appending.
#
# 4. **Piping:**
#    - `|` : Pipes the stdout of one command as the stdin to another command.
#
# Each section includes detailed examples and explanations to illustrate the usage
# and effects of these redirection techniques.
# =====================================================================

echo "Demonstrating various output redirection methods in Bash."
echo "--------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Redirecting Standard Output (stdout) Using '>'
# Redirects the output of the 'echo' command to 'output.txt', overwriting the file.
# ---------------------------------------------------------------------
echo -e "\nExample 1: Redirecting Standard Output (stdout) Using '>'"
echo "This message will be written to output.txt, overwriting any existing content."
echo "Hello, World!" > output.txt
echo "Content of output.txt:"
cat output.txt

# ---------------------------------------------------------------------
# Example 2: Appending to a File Using '>>'
# Appends the output of the 'echo' command to 'output.txt' without overwriting.
# ---------------------------------------------------------------------
echo -e "\nExample 2: Appending to a File Using '>>'"
echo "This message will be appended to output.txt."
echo "Appending a new line." >> output.txt
echo "Updated content of output.txt:"
cat output.txt

# ---------------------------------------------------------------------
# Example 3: Redirecting Standard Error (stderr) Using '2>'
# Attempts to list a non-existent directory and redirects the error message to 'error.log'.
# ---------------------------------------------------------------------
echo -e "\nExample 3: Redirecting Standard Error (stderr) Using '2>'"
ls /non_existent_directory 2> error.log
echo "Attempted to list a non-existent directory."
echo "Content of error.log:"
cat error.log

# ---------------------------------------------------------------------
# Example 4: Redirecting Both stdout and stderr Using '&>'
# Redirects both standard output and standard error to 'all_output.log'.
# ---------------------------------------------------------------------
echo -e "\nExample 4: Redirecting Both stdout and stderr Using '&>'"
echo "This message goes to both stdout and stderr."
ls /another_non_existent_directory &> all_output.log
echo "Both stdout and stderr have been redirected to all_output.log."
echo "Content of all_output.log:"
cat all_output.log

# ---------------------------------------------------------------------
# Example 5: Explicitly Redirecting stdout Using '1>'
# Redirects standard output to 'stdout.txt' explicitly using file descriptor 1.
# ---------------------------------------------------------------------
echo -e "\nExample 5: Explicitly Redirecting stdout Using '1>'"
echo "This message is redirected using file descriptor 1 to stdout.txt." 1> stdout.txt
echo "Content of stdout.txt:"
cat stdout.txt

# ---------------------------------------------------------------------
# Example 6: Explicitly Appending stdout Using '1>>'
# Appends standard output to 'stdout_append.txt' using file descriptor 1.
# ---------------------------------------------------------------------
echo -e "\nExample 6: Explicitly Appending stdout Using '1>>'"
echo "Appending this message to stdout_append.txt using '1>>'." 1>> stdout_append.txt
echo "Content of stdout_append.txt:"
cat stdout_append.txt

# ---------------------------------------------------------------------
# Example 7: Redirecting stderr Using '2>'
# Redirects standard error to 'stderr.log' using file descriptor 2.
# ---------------------------------------------------------------------
echo -e "\nExample 7: Redirecting stderr Using '2>'"
ls /yet_another_non_existent_directory 2> stderr.log
echo "Attempted to list another non-existent directory."
echo "Content of stderr.log:"
cat stderr.log

# ---------------------------------------------------------------------
# Example 8: Appending stderr Using '2>>'
# Appends standard error to 'stderr_append.log' using file descriptor 2.
# ---------------------------------------------------------------------
echo -e "\nExample 8: Appending stderr Using '2>>'"
ls /still_non_existent_directory 2>> stderr_append.log
echo "Appended error message to stderr_append.log."
echo "Content of stderr_append.log:"
cat stderr_append.log

# ---------------------------------------------------------------------
# Example 9: Redirecting Both stdout and stderr Using '&>>'
# Redirects both stdout and stderr to 'both_append.log', appending to the file.
# ---------------------------------------------------------------------
echo -e "\nExample 9: Redirecting Both stdout and stderr Using '&>>'"
echo "This message is both appended to stdout and stderr."
ls /another_fake_directory &>> both_append.log
echo "Both stdout and stderr have been appended to both_append.log."
echo "Content of both_append.log:"
cat both_append.log

# ---------------------------------------------------------------------
# Example 10: Redirecting Input Using '<'
# Uses 'cat' to display the content of 'output.txt' by redirecting it as input.
# ---------------------------------------------------------------------
echo -e "\nExample 10: Redirecting Input Using '<'"
echo "Content of output.txt using input redirection:"
cat < output.txt

# ---------------------------------------------------------------------
# Example 11: Here-Document Using '<<'
# Provides multiline input to the 'cat' command directly within the script.
# ---------------------------------------------------------------------
echo -e "\nExample 11: Here-Document Using '<<'"
cat << EOF > here_document.txt
This is a here-document.
It allows you to provide multiline input.
EOF
echo "Content of here_document.txt:"
cat here_document.txt

# ---------------------------------------------------------------------
# Example 12: Piping Output Using '|'
# Pipes the output of 'ls' to 'grep' to filter and display only '.txt' files.
# ---------------------------------------------------------------------
echo -e "\nExample 12: Piping Output Using '|'"
echo "Listing only .txt files in the current directory:"
ls | grep ".txt"

# ---------------------------------------------------------------------
# Example 13: Combining Pipes and Redirection
# Pipes the output of 'ls' to 'grep' and redirects the filtered output to 'filtered_output.txt'.
# ---------------------------------------------------------------------
echo -e "\nExample 13: Combining Pipes and Redirection"
ls | grep ".txt" > filtered_output.txt
echo "Filtered .txt files have been written to filtered_output.txt."
echo "Content of filtered_output.txt:"
cat filtered_output.txt

# ---------------------------------------------------------------------
# Example 14: Using 'tee' with Redirection
# Uses 'tee' to write output to both the terminal and a file simultaneously.
# ---------------------------------------------------------------------
echo -e "\nExample 14: Using 'tee' with Redirection"
echo "This message is displayed on the terminal and written to tee_output.txt." | tee tee_output.txt

# ---------------------------------------------------------------------
# Example 15: Redirecting stderr to stdout Using '2>&1'
# Redirects stderr to stdout, allowing both to be piped together.
# ---------------------------------------------------------------------
echo -e "\nExample 15: Redirecting stderr to stdout Using '2>&1'"
ls /non_existent_directory 2>&1 | tee combined_output.log
echo "Both stdout and stderr have been piped and written to combined_output.log."
echo "Content of combined_output.log:"
cat combined_output.log

# ---------------------------------------------------------------------
# Example 16: Using 'exec' for Persistent Redirection
# Redirects all subsequent stdout and stderr in the script to respective files.
# ---------------------------------------------------------------------
echo -e "\nExample 16: Using 'exec' for Persistent Redirection"

# Save original file descriptors
exec 3>&1 4>&2

# Redirect stdout to exec_stdout.log and stderr to exec_stderr.log
exec > exec_stdout.log 2> exec_stderr.log

# Commands after exec will have their outputs redirected
echo "This message goes to exec_stdout.log."
ls /another_fake_directory  # This error goes to exec_stderr.log

# Restore original file descriptors
exec 1>&3 3>&- 2>&4 4>&-

echo "End of script. Check the respective log files for redirected outputs."

# =====================================================================
# End of Script
# =====================================================================

