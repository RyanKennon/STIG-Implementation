<#
.SYNOPSIS
    This script creates the WinRM policy registry path if it does not exist and sets the AllowBasic DWORD value to 0, disabling Basic authentication for the WinRM service

.NOTES
    Author          : Ryan Kennon
    LinkedIn        : linkedin.com/in/ryan-kennon/
    GitHub          : github.com/RyanKennon
    Date Created    : 03/06/2026
    Last Modified   : 03/06/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000345

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000345).ps1 
#>

# Disable Basic Authentication for WinRM Service
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service"
$name = "AllowBasic"
$value = 0

# Create the registry key if it does not exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null

# Verify the setting
Get-ItemProperty -Path $path -Name $name | Select-Object $name
