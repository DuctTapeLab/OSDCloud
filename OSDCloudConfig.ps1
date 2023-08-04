Write-Host  -ForegroundColor Yellow "Starting Custom OSDCloud Deployment ..."
cls
Write-Host "===================== Main Menu =======================" -ForegroundColor Yellow
Write-Host "================ OSD Cloud Deployment =================" -ForegroundColor Yellow
Write-Host "=======================v.1.0.0 ========================" -ForegroundColor Yellow
Write-Host "=======================================================" -ForegroundColor Yellow
Write-Host "1: Windows 11 Enterprise 22H2"-ForegroundColor Yellow
Write-Host "2: Exit`n"-ForegroundColor Yellow
$input = Read-Host "Please make a selection"

Write-Host  -ForegroundColor Yellow "Loading OSDCloud..."

#Install-Module OSD -Force 
#Import-Module OSD -Force

switch ($input)
{
    '1' { Start-OSDCloud -OSLanguage en-us -OSVersion 'Windows 11' -OSBuild 22H2 -Firmware -SkipAutopilot } 
    '2' { Exit		}
}

wpeutil reboot
