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

Write-Host -ForegroundColor Cyan 'Updating Windows'
    if (!(Get-Module PSWindowsUpdate -ListAvailable)) {
        try {
            Install-Module PSWindowsUpdate -Force -SkipPublisherCheck
            Import-Module PSWindowsUpdate -Force
        }
        catch {
            Write-Warning 'Unable to install PSWindowsUpdate Windows Updates'
        }
    }
    if (Get-Module PSWindowsUpdate -ListAvailable -ErrorAction Ignore) {
        #Write-Host -ForegroundColor DarkCyan 'Add-WUServiceManager -MicrosoftUpdate -Confirm:$false'
        Add-WUServiceManager -MicrosoftUpdate -Confirm:$false | Out-Null
        #Write-Host -ForegroundColor DarkCyan 'Install-WindowsUpdate -UpdateType Software -AcceptAll -IgnoreReboot'
        #Install-WindowsUpdate -UpdateType Software -AcceptAll -IgnoreReboot -NotTitle 'Malicious'
        #Write-Host -ForegroundColor DarkCyan 'Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot'
        Start-Process PowerShell.exe -ArgumentList "-Command Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot -NotTitle 'Preview' -NotKBArticleID 'KB890830','KB5005463','KB4481252'" -Wait
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
