<#

---DISCLAIMER---

This script has been created by COMPTEC I.T InfoSec Department (www.comptecit.com) to protect its customers in response to the remote code execution (RCE) vulnerability — CVE-2022-30190 (disclosed by Microsoft on May 30th 2022), dubbed as "Follina".
We decided to make it publicly available to contribute to the greater I.T Community; thus, you are free to use it.

COMPTEC I.T is not and can not be held liable by anyone deciding to use this script for their own intended purposes. End Results may vary and may produce different results as expected.
COMPTEC I.T cannot be held accountable for any results it produces. Therefore, we recommend that anyone intending to use this script clearly understand the technical impact this may produce. 
While choosing to run this script, we highly recommend from a technical viewpoint, you complete due diligence and have a full and clear understanding of what you have initiated to run by using the script. 
The script has been tested in our environments, and the results may vary according to your expectations.

---Mitigation Purpose---

The script creates a Registry key which prohibits users from accessing or running the troubleshooting tools from the Control Panel (https://admx.help/?Category=Windows_10_2016&Policy=Microsoft.Policies.ScriptedDiagnostics::ScriptedDiagnosticsExecutionPolicy).

---Operating System compatibility---

The script has been tested in Windows Server 2012 R2 to Windows Server 2019 and Windows 10/Windows 11 releases.

---Deployment---

The script can be deployed through either Active Directory Group Policy Management OR Microsoft Endpoint Manager (Intune MDM) OR any other 3rd party software that can push scripts in an environment.

#>

# --- START SCRIPT---

#Temporarily change PowerShell Execution Policy to allow the script to run

Set-ExecutionPolicy Bypass

#Create Registry Key

New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows' -Name 'ScriptedDiagnostics'

# Set variables to indicate value and key to set

$RegistryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\ScriptedDiagnostics'
$Name         = 'EnableDiagnostics'
$Value        = '0'

#Disable Troubleshooting Wizards

New-ItemProperty -Path $RegistryPath -Name $Name -Value $Value -PropertyType DWORD -Force

# --- END SCRIPT---