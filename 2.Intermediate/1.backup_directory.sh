#!/bin/bash

################### Variables ###################

#SOURCE_DIR="/path/to/source_directory"
read -p "Please Enter the path to SOURCE_DIR : " SOURCE_DIR

#BACKUP_DIR="/path/to/backup_directory"
read -p "Please Enter the path to BACKUP_DIR : " BACKUP_DIR

# date stamp in backup directory
DATE=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="backup_${DATE}.tar.gz"

################### Backup_directory ############
mkdir -p "$BACKUP_DIR"


################### Create backup ###############
# The archive does not contain the directory it contains only its contents.
tar -czvf $BACKUP_DIR/$BACKUP_FILE -C $SOURCE_DIR .

#You only want to archive the contents of a directory without including the directory itself.
#tar -czvf $BACKUP_DIR/$BACKUP_FILE $SOURCE_DIR

################### Verify the task #############

if [ $? -eq 0 ]
then
	echo "Backup is successful : ${BACKUP_DIR}/${BACKUP_FILE}"
else
	echo "Backup is failed !"
	exit 1
fi 


