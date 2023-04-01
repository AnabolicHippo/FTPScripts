import os
import subprocess

# Local directory containing files to send
local_directory = "./Files"

# FTP upload PowerShell script path
ps_script_path = "./ftp.ps1"

# Remote directory
remote_dir = "/"

# Iterate through all files in the local_directory
for filename in os.listdir(local_directory):
    local_file = os.path.join(local_directory, filename)
    
    # Skip if it's not a file
    if not os.path.isfile(local_file):
        continue

    # Call the PowerShell script with required parameters
    subprocess.run(["powershell", "-ExecutionPolicy", "Bypass", "-File", ps_script_path, local_file, remote_dir, filename], check=True)

print("All files uploaded successfully.")


