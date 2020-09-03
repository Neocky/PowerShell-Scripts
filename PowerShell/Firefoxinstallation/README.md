# This simple Script will install Microsoft Firefox

Currently it installs the german version of it. Change the firefoxdownload link if you want ohter languages.

To have it really silent you have to run it in a .bat file with this in it:

`@ECHO OFF  
PowerShell.exe -windowstyle hidden -NoProfile -Command "& {Start-Process PowerShell.exe -ArgumentList '-windowstyle hidden -NoProfile -ExecutionPolicy Bypass -File %~dp0Firefoxinstall.ps1' -Verb RunAs}"`

The .bat file needs to be in the same directory as the sricpt
