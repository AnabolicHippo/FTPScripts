# Set variables
$FTP_SERVER = "ftp.mistissinilodge.com"
$FTP_USERNAME = "scott@mistissinilodge.com"
$FTP_PASSWORD = "K1ngH1pp03ats"
$LOCAL_FILE = $args[0] # Use the first command-line argument
$REMOTE_DIR = $args[1] # Use the second command-line argument
$REMOTE_FILE = $args[2] # Use the third command-line argument

# Create an FTP request
$ftpRequest = [System.Net.FtpWebRequest]::Create("ftp://$FTP_SERVER/$REMOTE_DIR/$REMOTE_FILE")
$ftpRequest.Method = [System.Net.WebRequestMethods+Ftp]::UploadFile
$ftpRequest.Credentials = New-Object System.Net.NetworkCredential($FTP_USERNAME, $FTP_PASSWORD)
$ftpRequest.UseBinary = $true
$ftpRequest.KeepAlive = $false

# Read local file and upload to FTP server
$content = [System.IO.File]::ReadAllBytes($LOCAL_FILE)
$ftpStream = $ftpRequest.GetRequestStream()
$ftpStream.Write($content, 0, $content.Length)
$ftpStream.Close()

Write-Host "File uploaded successfully."
