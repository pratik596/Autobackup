@echo off
setlocal

REM Set the API URL of the file you want to download
set "apiUrl=https://fakestoreapi.com/products/5"

REM Download the JSON data using curl and save it as "data.json"
curl -o data.json "%apiUrl%"

REM Use PowerShell to parse and fetch a specific value from the JSON data
for /f %%a in ('powershell -command "$json = Get-Content -Raw data.json | ConvertFrom-Json; $json.image"') do set "extracted_data=%%a"


REM echo Extracted data: %extracted_data%

REM Set the directory where you want to save the downloaded file
set "outputDirectory=D:\Backup\"

REM Generate a random file name
set "randomFileName=admindragon_%random%.jpg"

REM Combine the directory and file name to create the full output path
set "outputPath=%outputDirectory%%randomFileName%"

REM Download the file using curl
curl -o "%outputPath%" "%extracted_data%"

echo File downloaded successfully: %outputPath%

REM Pause to keep the terminal window open and wait for a key press
REM pause

endlocal
