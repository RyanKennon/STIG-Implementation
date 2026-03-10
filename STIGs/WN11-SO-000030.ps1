<#
.SYNOPSIS
    This PowerShell script ensures the required registry key exists and sets SCENoApplyLegacyAuditPolicy to 1, which forces Windows to use advanced audit policy settings instead of legacy audit policies.

.NOTES
    Author          : Ryan Kennon
    LinkedIn        : linkedin.com/in/ryan-kennon/
    GitHub          : github.com/RyanKennon
    Date Created    : 03/10/2026
    Last Modified   : 03/10/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-SO-000030

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-SO-000030).ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"

# Create the registry key if it does not exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath `
    -Name "SCENoApplyLegacyAuditPolicy" `
    -PropertyType DWord `
    -Value 1 `
    -Force | Out-Null

Write-Host "Registry setting applied successfully."
