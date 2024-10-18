#!/bin/bash

# This command works on mac

# Define variable
REMOTE_USER="asyamsul24"
REMOTE_HOST="boson.nd.phen.mie-u.ac.jp"
REMOTE_DIR="./sync_folder"  # Ensure this path is correct for the remote server
LOCAL_DIR="/Users/andisyamsul/sync_folder"

# Check if the local directory exists
if [ ! -d "$LOCAL_DIR" ]; then
  echo "Creating local directory '$LOCAL_DIR'."
  mkdir -p "$LOCAL_DIR"  # Create the local directory if it doesn't exist
fi

# Start the SFTP session
sftp "$REMOTE_USER@$REMOTE_HOST" <<EOF
cd $REMOTE_DIR
lcd $LOCAL_DIR
mput *
bye
EOF

# Check if SFTP completed successfully
if [ $? -eq 0 ]; then
  echo "All files from '$REMOTE_HOST:$REMOTE_DIR' successfully downloaded to '$LOCAL_DIR'."
else
  echo "SFTP download failed."
  exit 1
fi

