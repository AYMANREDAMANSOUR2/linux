#!/bin/bash

#important var

SOURCE="/Documents" # i wanna backup this 
DESTINATION="$HOME/Backups" # i'll backup it here
DATE=$(date +%Y-%m-%d-%H-%M ) #timestamp
LOGFILE="$DESTINATION/backup-$DATE.log" #logs for this process


if [ ! -d "$SOURCE" ]; then 
	echo "Error: Source directory '$SOURCE' does not exist." >> "$LOGFILE"
	echo "Backup failed due to missing source directory." >> "$LOGFILE"
	exit 1  # Exit the script with error code 1
fi





mkdir -p "$DESTINATION" # if it dont exist create it 
tar -czvf "$DESTINATION/backup-$DATE.tar.gz" "$SOURCE" > "$LOGFILE" 2>&1  # 

if [ $? -eq 0 ]; then
    echo "CONGRATULATION! Backup finished successfully at $(date)" >> "$LOGFILE"
else
    echo "Error: Backup failed during tar execution." >> "$LOGFILE"
    exit 2  # Exit with error code 2 for failure in the tar command
fi




#It will create a compressed archive using gzip from the files located in the SOURCE
#It will name the archive backup-YYYY-MM-DD-HH-MM.tar.gz and save it in the path specified in the DESTINATION variable.
#It will log all the operations that take place (and any errors if they occur) into the log file specified in $LOGFILE.



