<#
.SYNOPSIS
    This PowerShell script ensures the required Kerberos registry path exists and sets the SupportedEncryptionTypes value to 0x7ffffff8, which configures Windows to allow only modern, secure Kerberos encryption algorithms.

.NOTES
    Author          : Ryan Kennon
    LinkedIn        : linkedin.com/in/ryan-kennon/
    GitHub          : github.com/RyanKennon
    Date Created    : 03/10/2026
    Last Modified   : 03/10/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000190

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000190).ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters"

# Create the registry key if it does not exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath `
    -Name "SupportedEncryptionTypes" `
    -PropertyType DWord `
    -Value 0x7ffffff8 `
    -Force | Out-Null

Write-Host "Kerberos encryption types policy applied successfully."
