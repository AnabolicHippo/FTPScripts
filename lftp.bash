#!/bin/bash

# Set variables
FTP_SERVER="ftp.mistissinilodge.com"
FTP_USERNAME="slforward"
FTP_PASSWORD="K1ngH1pp03ats"
LOCAL_FILE="$1" # Use the first command-line argument
REMOTE_DIR="$2" # Use the second command-line argument
REMOTE_FILE="$3" # Use the third command-line argument

# Upload file to FTP server using lftp
lftp -c "
set ftp:ssl-allow no;
set ftp:passive-mode true;
open ftp://${FTP_USERNAME}:${FTP_PASSWORD}@${FTP_SERVER};
cd ${REMOTE_DIR};
put ${LOCAL_FILE} -o ${REMOTE_FILE};
bye
"
