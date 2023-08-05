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

#Import-Module OSD -Force
#Install-Module OSD -Force

switch ($input)
{
    '1' { Start-OSDCloud -OSLanguage en-us -OSVersion 'Windows 11' -OSBuild 22H2 -OSEdition Enterprise} 
    '2' { Exit		}
}

Write-Host "Cleaning up OSDCloud..." -ForegroundColor yellow 

Copy-Item -Path C:\OSDCloud\Logs -Destination C:\Windows\Logs\OSDCloud -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\Drivers -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud\configs -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud\OS -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud\Drivers -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud\Packages -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud\Scripts -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud\Temp -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud\Logs -Force -Recurse -ErrorAction SilentlyContinue
Remove-Item -Path C:\OSDCloud -Force -Recurse -ErrorAction SilentlyContinue

wpeutil reboot
