<#
.SYNOPSIS
    This PowerShell script ensures that the required registry path exists and sets the AutoConnectAllowedOEM value to 0, which disables OEM-configured automatic connections to Wi-Fi networks. This prevents systems from automatically connecting to manufacturer-preconfigured wireless networks

.NOTES
    Author          : Ryan Kennon
    LinkedIn        : linkedin.com/in/ryan-kennon/
    GitHub          : github.com/RyanKennon
    Date Created    : 03/10/2026
    Last Modified   : 03/10/2026
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN11-CC-000065

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN11-CC-000065).ps1 
#>

# Define the registry path
$registryPath = "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config"

# Create the registry key if it does not exist
if (!(Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Set the registry value
New-ItemProperty -Path $registryPath `
    -Name "AutoConnectAllowedOEM" `
    -PropertyType DWord `
    -Value 0 `
    -Force | Out-Null

Write-Host "Wi-Fi auto-connect policy applied successfully."
