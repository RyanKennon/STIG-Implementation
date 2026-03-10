<#
.SYNOPSIS
    This PowerShell script enables PowerShell transcription logging through Group Policy. This causes PowerShell sessions to record executed commands and output to transcript logs for auditing and security monitoring.

.NOTES
    Author          : Ryan Kennon
    LinkedIn        : linkedin.com/in/ryan-kennon/
    GitHub          : github.com/RyanKennon
    Date Created    : 03/09/2026
    Last Modified   : 03/09/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000327

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000327).ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"

# Create the registry key if it does not exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath `
    -Name "EnableTranscripting" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "PowerShell transcription has been enabled successfully."
