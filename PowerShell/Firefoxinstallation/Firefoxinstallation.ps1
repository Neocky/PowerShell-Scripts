# A simple unattended Mozilla Firefox installtion
# By github.com/Neocky


# Should Firefox be installed ($true  / $false)?
$FirefoxInstall = $true

# Ohter variables
$SetupFolder = "C:\SetupPS"
$LogFolder = "C:\log.txt"
$FirefoxLink = "https://download.mozilla.org/?product=firefox-latest-ssl&os=win64&lang=de"


#Start logging and the script
Start-Transcript -Path $LogFolder

# $SetupFolder is created if it doesn't already exist
$SetupFolderExists = Test-Path $SetupFolder
Write-Output "$SetupFolder exists: $SetupFolderExists"
if ($SetupFolderExists) {
    Write-Output "$SetupFolder already exists"
} else {
    New-Item -Path $SetupFolder -ItemType "directory"
    Write-Output "$SetupFolder created"
    }

# Installation of Firefox
Write-Output "Should Firefox be installed: $FireFoxInstall"
if ($FirefoxInstall) {
    $FirefoxInstaller = $SetupFolder + "\firefox.exe"
    Invoke-WebRequest $FirefoxLink -OutFile $FirefoxInstaller
    Start-Process -FilePath $FirefoxInstaller -ArgumentList "/s" -Verb RunAs -Wait
    Write-Output "Firefox succesfully installed"
} else {
    Write-Output "Firefox will not be installed"
}

# Deletion of $SetupFolder & end of script
Remove-Item -Path $SetupFolder -Recurse
Stop-Transcript