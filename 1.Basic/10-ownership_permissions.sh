#!/bin/bash

# =====================================================================
# Script Name: ownership_permissions.sh
# Description: Demonstrates how to check file and directory permissions,
#              ownership, and group ownership in Bash. Each section
#              provides detailed explanations and examples.
# Author: Jitendra Kumar
# =====================================================================

# =====================================================================
# Theory and Explanation:
# Managing file and directory permissions, ownership, and group ownership
# is fundamental in Unix-like operating systems. Properly setting these
# attributes ensures system security, proper access control, and
# efficient collaboration among users.
#
# **Key Concepts:**
#
# 1. **File Permissions:**
#    - **Read (r):** Permission to read the file or list the directory.
#    - **Write (w):** Permission to modify the file or directory contents.
#    - **Execute (x):** Permission to execute the file or access the directory.
#    - Permissions are categorized into three groups:
#      - **Owner (u):** The user who owns the file.
#      - **Group (g):** The group that owns the file.
#      - **Others (o):** All other users.
#    - Permissions are represented as a string of 10 characters, e.g., `-rwxr-xr--`.
#
# 2. **Ownership:**
#    - **Owner:** The user who owns the file. Can be changed using `chown`.
#    - **Group Ownership:** The group that owns the file. Can be changed using `chgrp`.
#
# 3. **Group Ownership:**
#    - Users can belong to multiple groups. Group ownership determines
#      the permissions for users in that group.
#
# 4. **Checking Permissions and Ownership:**
#    - **ls -l:** Lists files with detailed permissions and ownership information.
#    - **stat:** Provides detailed status of a file or directory.
#    - **id:** Displays user and group information.
#    - **whoami:** Displays the current user.
#
# 5. **Understanding Permission Symbols:**
#    - **First Character:**
#      - `-`: Regular file
#      - `d`: Directory
#      - `l`: Symbolic link
#      - Others: Various special file types
#    - **Next Nine Characters:**
#      - Divided into three sets of three:
#        - **Owner Permissions**
#        - **Group Permissions**
#        - **Others Permissions**
#      - Each set contains `r`, `w`, `x` or `-` if the permission is not granted.
#
# **Best Practices:**
#
# - **Least Privilege Principle:** Grant only the permissions necessary.
# - **Regularly Audit Permissions:** Ensure that permissions are set correctly.
# - **Use Groups for Access Control:** Manage permissions efficiently by grouping users.
# - **Avoid Using Root:** Perform tasks with the least necessary privileges.
#
# This script provides comprehensive examples on how to check and interpret
# file and directory permissions, ownership, and group ownership using various
# commands and conditional statements in Bash.
# =====================================================================

echo "Demonstrating how to check file and directory permissions, ownership, and group ownership in Bash."
echo "----------------------------------------------------------------------------------------------"

# ---------------------------------------------------------------------
# Example 1: Listing Permissions with ls -l
# ---------------------------------------------------------------------
echo -e "\nExample 1: Listing Permissions with ls -l"
echo "Enter the path to a file or directory:"
read path1

if [ -e "$path1" ]; then
    ls -l "$path1"
else
    echo "The path '$path1' does not exist."
fi
# Explanation:
# - `ls -l` lists files with detailed information including permissions,
#   number of links, owner, group, size, and modification date.
# - The first character indicates the type (e.g., '-' for file, 'd' for directory).
# - The next nine characters represent permissions for owner, group, and others.

# ---------------------------------------------------------------------
# Example 2: Using stat to Get Detailed Information
# ---------------------------------------------------------------------
echo -e "\nExample 2: Using stat to Get Detailed Information"
echo "Enter the path to a file or directory:"
read path2

if [ -e "$path2" ]; then
    stat "$path2"
else
    echo "The path '$path2' does not exist."
fi
# Explanation:
# - `stat` provides detailed information about the file or directory,
#   including inode number, permissions, ownership, size, and timestamps.

# ---------------------------------------------------------------------
# Example 3: Checking Current User with whoami
# ---------------------------------------------------------------------
echo -e "\nExample 3: Checking Current User with whoami"
current_user=$(whoami)
echo "Current user: $current_user"
# Explanation:
# - `whoami` displays the username of the current user executing the script.

# ---------------------------------------------------------------------
# Example 4: Displaying User and Group Information with id
# ---------------------------------------------------------------------
echo -e "\nExample 4: Displaying User and Group Information with id"
id_info=$(id)
echo "$id_info"
# Explanation:
# - `id` displays the user ID (uid), primary group ID (gid), and groups the user belongs to.

# ---------------------------------------------------------------------
# Example 5: Checking File Ownership
# ---------------------------------------------------------------------
echo -e "\nExample 5: Checking File Ownership"
echo "Enter the path to a file or directory:"
read path3

if [ -e "$path3" ]; then
    owner=$(stat -c '%U' "$path3")
    group=$(stat -c '%G' "$path3")
    echo "Owner: $owner"
    echo "Group: $group"
else
    echo "The path '$path3' does not exist."
fi
# Explanation:
# - `stat -c '%U'` retrieves the username of the file's owner.
# - `stat -c '%G'` retrieves the group name of the file.

# ---------------------------------------------------------------------
# Example 6: Checking If Current User Owns the File
# ---------------------------------------------------------------------
echo -e "\nExample 6: Checking If Current User Owns the File"
echo "Enter the path to a file or directory:"
read path4

if [ -e "$path4" ]; then
    owner=$(stat -c '%U' "$path4")
    if [ "$owner" = "$current_user" ]; then
        echo "You are the owner of '$path4'."
    else
        echo "You are not the owner of '$path4'. Owner is $owner."
    fi
else
    echo "The path '$path4' does not exist."
fi
# Explanation:
# - Compares the current user with the file's owner to determine ownership.

# ---------------------------------------------------------------------
# Example 7: Checking Group Ownership
# ---------------------------------------------------------------------
echo -e "\nExample 7: Checking Group Ownership"
echo "Enter the path to a file or directory:"
read path5

if [ -e "$path5" ]; then
    group=$(stat -c '%G' "$path5")
    echo "Group ownership of '$path5': $group"
else
    echo "The path '$path5' does not exist."
fi
# Explanation:
# - Retrieves and displays the group ownership of the specified file or directory.

# ---------------------------------------------------------------------
# Example 8: Checking Read Permission
# ---------------------------------------------------------------------
echo -e "\nExample 8: Checking Read Permission"
echo "Enter the path to a file or directory:"
read path6

if [ -e "$path6" ]; then
    if [ -r "$path6" ]; then
        echo "You have read permission on '$path6'."
    else
        echo "You do NOT have read permission on '$path6'."
    fi
else
    echo "The path '$path6' does not exist."
fi
# Explanation:
# - `-r` checks if the file or directory is readable by the current user.

# ---------------------------------------------------------------------
# Example 9: Checking Write Permission
# ---------------------------------------------------------------------
echo -e "\nExample 9: Checking Write Permission"
echo "Enter the path to a file or directory:"
read path7

if [ -e "$path7" ]; then
    if [ -w "$path7" ]; then
        echo "You have write permission on '$path7'."
    else
        echo "You do NOT have write permission on '$path7'."
    fi
else
    echo "The path '$path7' does not exist."
fi
# Explanation:
# - `-w` checks if the file or directory is writable by the current user.

# ---------------------------------------------------------------------
# Example 10: Checking Execute Permission
# ---------------------------------------------------------------------
echo -e "\nExample 10: Checking Execute Permission"
echo "Enter the path to a file or directory:"
read path8

if [ -e "$path8" ]; then
    if [ -x "$path8" ]; then
        echo "You have execute permission on '$path8'."
    else
        echo "You do NOT have execute permission on '$path8'."
    fi
else
    echo "The path '$path8' does not exist."
fi
# Explanation:
# - `-x` checks if the file is executable or if the directory can be accessed.

# ---------------------------------------------------------------------
# Example 11: Checking Multiple Permissions
# ---------------------------------------------------------------------
echo -e "\nExample 11: Checking Multiple Permissions"
echo "Enter the path to a file or directory:"
read path9

if [ -e "$path9" ]; then
    permissions=$(stat -c '%A' "$path9")
    echo "Permissions of '$path9': $permissions"
    
    # Breakdown permissions
    owner_perm=${permissions:1:3}
    group_perm=${permissions:4:3}
    others_perm=${permissions:7:3}
    
    echo "Owner Permissions: $owner_perm"
    echo "Group Permissions: $group_perm"
    echo "Others Permissions: $others_perm"
else
    echo "The path '$path9' does not exist."
fi
# Explanation:
# - `stat -c '%A'` retrieves the permissions string.
# - Extracts and displays owner, group, and others permissions separately.

# ---------------------------------------------------------------------
# Example 12: Checking If a Directory is Writable
# ---------------------------------------------------------------------
echo -e "\nExample 12: Checking If a Directory is Writable"
echo "Enter the path to a directory:"
read dir1

if [ -d "$dir1" ]; then
    if [ -w "$dir1" ]; then
        echo "You can create or delete files in '$dir1'."
    else
        echo "You cannot create or delete files in '$dir1'."
    fi
else
    echo "'$dir1' is not a directory."
fi
# Explanation:
# - Checks if the directory is writable, which allows creating or deleting files.

# ---------------------------------------------------------------------
# Example 13: Checking If a File is Executable
# ---------------------------------------------------------------------
echo -e "\nExample 13: Checking If a File is Executable"
echo "Enter the path to a file:"
read file1

if [ -f "$file1" ]; then
    if [ -x "$file1" ]; then
        echo "File '$file1' is executable."
    else
        echo "File '$file1' is not executable."
    fi
else
    echo "'$file1' is not a regular file."
fi
# Explanation:
# - Ensures the path is a regular file before checking execute permission.

# ---------------------------------------------------------------------
# Example 14: Checking Symbolic Link Permissions
# ---------------------------------------------------------------------
echo -e "\nExample 14: Checking Symbolic Link Permissions"
echo "Enter the path to a symbolic link:"
read symlink1

if [ -L "$symlink1" ]; then
    target=$(readlink "$symlink1")
    echo "Symbolic link '$symlink1' points to '$target'."
    ls -l "$symlink1"
else
    echo "'$symlink1' is not a symbolic link."
fi
# Explanation:
# - `-L` checks if the path is a symbolic link.
# - `readlink` retrieves the target of the symbolic link.
# - `ls -l` displays permissions and ownership of the link and target.

# ---------------------------------------------------------------------
# Example 15: Checking Hidden Files and Directories
# ---------------------------------------------------------------------
echo -e "\nExample 15: Checking Hidden Files and Directories"
echo "Enter the path to a directory:"
read dir2

if [ -d "$dir2" ]; then
    echo "Listing hidden files and directories in '$dir2':"
    ls -ld "$dir2"/.*
else
    echo "'$dir2' is not a directory."
fi
# Explanation:
# - Hidden files and directories start with a dot (.).
# - `ls -ld` lists details without following symbolic links.

# ---------------------------------------------------------------------
# Example 16: Checking If a File is Readable by Owner, Group, and Others
# ---------------------------------------------------------------------
echo -e "\nExample 16: Checking If a File is Readable by Owner, Group, and Others"
echo "Enter the path to a file:"
read file2

if [ -f "$file2" ]; then
    permissions=$(stat -c '%A' "$file2")
    owner_read=${permissions:1:1}
    group_read=${permissions:4:1}
    others_read=${permissions:7:1}
    
    echo "Read Permissions:"
    echo "Owner: ${owner_read}"
    echo "Group: ${group_read}"
    echo "Others: ${others_read}"
    
    [ "$owner_read" = "r" ] && echo "Owner has read permission."
    [ "$group_read" = "r" ] && echo "Group has read permission."
    [ "$others_read" = "r" ] && echo "Others have read permission."
else
    echo "'$file2' is not a regular file."
fi
# Explanation:
# - Extracts individual read permissions for owner, group, and others.
# - Checks and displays which categories have read access.

# ---------------------------------------------------------------------
# Example 17: Changing Ownership with chown
# ---------------------------------------------------------------------
echo -e "\nExample 17: Changing Ownership with chown"
echo "Enter the path to a file:"
read file3
echo "Enter the new owner username:"
read new_owner

if [ -e "$file3" ]; then
    sudo chown "$new_owner" "$file3"
    echo "Ownership of '$file3' changed to $new_owner."
else
    echo "The path '$file3' does not exist."
fi
# Explanation:
# - `chown` changes the owner of the file.
# - Requires superuser privileges (`sudo`).

# ---------------------------------------------------------------------
# Example 18: Changing Group Ownership with chgrp
# ---------------------------------------------------------------------
echo -e "\nExample 18: Changing Group Ownership with chgrp"
echo "Enter the path to a file:"
read file4
echo "Enter the new group name:"
read new_group

if [ -e "$file4" ]; then
    sudo chgrp "$new_group" "$file4"
    echo "Group ownership of '$file4' changed to $new_group."
else
    echo "The path '$file4' does not exist."
fi
# Explanation:
# - `chgrp` changes the group ownership of the file.
# - Requires superuser privileges (`sudo`).

# ---------------------------------------------------------------------
# Example 19: Changing Permissions with chmod (Symbolic)
# ---------------------------------------------------------------------
echo -e "\nExample 19: Changing Permissions with chmod (Symbolic)"
echo "Enter the path to a file or directory:"
read path10
echo "Enter the permission change (e.g., u+x, g-w, o=r):"
read perm_change

if [ -e "$path10" ]; then
    chmod "$perm_change" "$path10"
    echo "Permissions of '$path10' changed with '$perm_change'."
    ls -l "$path10"
else
    echo "The path '$path10' does not exist."
fi
# Explanation:
# - `chmod` changes the permissions of the file or directory.
# - Symbolic notation (e.g., u+x) modifies specific permission bits.

# ---------------------------------------------------------------------
# Example 20: Changing Permissions with chmod (Numeric)
# ---------------------------------------------------------------------
echo -e "\nExample 20: Changing Permissions with chmod (Numeric)"
echo "Enter the path to a file or directory:"
read path11
echo "Enter the numeric permission (e.g., 755, 644):"
read numeric_perm

if [ -e "$path11" ]; then
    chmod "$numeric_perm" "$path11"
    echo "Permissions of '$path11' changed to '$numeric_perm'."
    ls -l "$path11"
else
    echo "The path '$path11' does not exist."
fi
# Explanation:
# - `chmod` can also use numeric notation to set permissions.
# - Each digit represents owner, group, and others permissions respectively.

# ---------------------------------------------------------------------
# Example 21: Checking If a Directory is Executable
# ---------------------------------------------------------------------
echo -e "\nExample 21: Checking If a Directory is Executable"
echo "Enter the path to a directory:"
read dir3

if [ -d "$dir3" ]; then
    if [ -x "$dir3" ]; then
        echo "You can access and traverse the directory '$dir3'."
    else
        echo "You cannot access or traverse the directory '$dir3'."
    fi
else
    echo "'$dir3' is not a directory."
fi
# Explanation:
# - Execute permission on a directory allows accessing and traversing it.

# ---------------------------------------------------------------------
# Example 22: Listing Groups of a User
# ---------------------------------------------------------------------
echo -e "\nExample 22: Listing Groups of a User"
echo "Enter the username:"
read username1

groups_of_user=$(groups "$username1" 2>/dev/null)
if [ $? -eq 0 ]; then
    echo "Groups for user '$username1': $groups_of_user"
else
    echo "User '$username1' does not exist."
fi
# Explanation:
# - `groups` lists all groups a user belongs to.
# - Redirects error output to `/dev/null` to handle non-existent users.

# ---------------------------------------------------------------------
# Example 23: Checking If Current User Belongs to a Group
# ---------------------------------------------------------------------
echo -e "\nExample 23: Checking If Current User Belongs to a Group"
echo "Enter the group name:"
read group1

if groups "$current_user" | grep -qw "$group1"; then
    echo "You are a member of the group '$group1'."
else
    echo "You are NOT a member of the group '$group1'."
fi
# Explanation:
# - Uses `groups` and `grep` to check group membership for the current user.

# ---------------------------------------------------------------------
# Example 24: Viewing ACLs (Access Control Lists)
# ---------------------------------------------------------------------
echo -e "\nExample 24: Viewing ACLs (Access Control Lists)"
echo "Enter the path to a file or directory:"
read path12

if [ -e "$path12" ]; then
    getfacl "$path12"
else
    echo "The path '$path12' does not exist."
fi
# Explanation:
# - `getfacl` displays the ACLs of a file or directory, showing extended permissions.

# ---------------------------------------------------------------------
# Example 25: Checking If a File is a Symbolic Link
# ---------------------------------------------------------------------
echo -e "\nExample 25: Checking If a File is a Symbolic Link"
echo "Enter the path to a file:"
read path13

if [ -L "$path13" ]; then
    echo "'$path13' is a symbolic link."
    target=$(readlink "$path13")
    echo "It points to '$target'."
else
    echo "'$path13' is not a symbolic link."
fi
# Explanation:
# - `-L` checks if the path is a symbolic link.
# - `readlink` retrieves the target of the symbolic link.

# ---------------------------------------------------------------------
# Example 26: Checking If a File is a Regular File
# ---------------------------------------------------------------------
echo -e "\nExample 26: Checking If a File is a Regular File"
echo "Enter the path to a file:"
read path14

if [ -f "$path14" ]; then
    echo "'$path14' is a regular file."
else
    echo "'$path14' is not a regular file."
fi
# Explanation:
# - `-f` checks if the path is a regular file.

# ---------------------------------------------------------------------
# Example 27: Checking If a File is a Directory
# ---------------------------------------------------------------------
echo -e "\nExample 27: Checking If a File is a Directory"
echo "Enter the path to a directory:"
read path15

if [ -d "$path15" ]; then
    echo "'$path15' is a directory."
else
    echo "'$path15' is not a directory."
fi
# Explanation:
# - `-d` checks if the path is a directory.

# ---------------------------------------------------------------------
# Example 28: Checking If a File is a Block Device
# ---------------------------------------------------------------------
echo -e "\nExample 28: Checking If a File is a Block Device"
echo "Enter the path to a file:"
read path16

if [ -b "$path16" ]; then
    echo "'$path16' is a block device."
else
    echo "'$path16' is not a block device."
fi
# Explanation:
# - `-b` checks if the file is a block device.

# ---------------------------------------------------------------------
# Example 29: Checking If a File is a Character Device
# ---------------------------------------------------------------------
echo -e "\nExample 29: Checking If a File is a Character Device"
echo "Enter the path to a file:"
read path17

if [ -c "$path17" ]; then
    echo "'$path17' is a character device."
else
    echo "'$path17' is not a character device."
fi
# Explanation:
# - `-c` checks if the file is a character device.

# ---------------------------------------------------------------------
# Example 30: Summary and Best Practices
# ---------------------------------------------------------------------
echo -e "\nExample 30: Summary and Best Practices"
echo "------------------------------------------------"
echo "1. Use `ls -l` to quickly view permissions, ownership, and group ownership."
echo "2. Use `stat` for detailed file or directory information."
echo "3. Use `whoami` and `id` to understand the current user's identity and group memberships."
echo "4. Always quote variables in test conditions to prevent word splitting."
echo "5. Prefer double brackets `[[ ]]` for enhanced string comparisons and pattern matching."
echo "6. Use `chmod` to modify permissions using symbolic or numeric notation."
echo "7. Use `chown` and `chgrp` to change ownership and group ownership respectively."
echo "8. Regularly audit file and directory permissions to maintain security."
echo "9. Use Access Control Lists (ACLs) for more granular permission management."
echo "10. Follow the Principle of Least Privilege by granting only necessary permissions."
# Explanation:
# - Summarizes the key points and best practices for managing and checking
#   file and directory permissions, ownership, and group ownership.
# - Reinforces the importance of understanding and correctly setting permissions
#   to ensure system security and proper access control.

# =====================================================================
# End of Script
# =====================================================================

