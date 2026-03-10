<#
.SYNOPSIS
    his PowerShell script creates (if necessary) the registry key for PowerShell Script Block Logging and sets the EnableScriptBlockLogging DWORD value to 1

.NOTES
    Author          : Ryan Kennon
    LinkedIn        : linkedin.com/in/ryan-kennon/
    GitHub          : github.com/RyanKennon
    Date Created    : 03-02-2026
    Last Modified   : 03-02-2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000326

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000326).ps1 
#>

# Enable PowerShell Script Block Logging (policy-based)
$path = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging"
$name = "EnableScriptBlockLogging"
$value = 1

# Create the registry key if it doesn't exist
if (-not (Test-Path $path)) {
    New-Item -Path $path -Force | Out-Null
}

# Set the DWORD value
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value $value -Force | Out-Null

# Verify
Get-ItemProperty -Path $path -Name $name | Select-Object $name
