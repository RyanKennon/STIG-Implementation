<#
.SYNOPSIS
    This PowerShell script ensures that NTLM authentication uses stronger security requirements, including NTLMv2 session security and 128-bit encryption.

.NOTES
    Author          : Ryan Kennon
    LinkedIn        : linkedin.com/in/ryan-kennon/
    GitHub          : github.com/RyanKennon
    Date Created    : 03/09/2026
    Last Modified   : 03/09/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000220

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000220).ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0"

# Create the registry key if it does not exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath `
    -Name "NtlmMinServerSec" `
    -PropertyType DWord `
    -Value 0x20080000 `
    -Force | Out-Null

Write-Host "Registry setting applied successfully."
