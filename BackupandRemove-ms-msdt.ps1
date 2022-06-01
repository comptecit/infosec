<#

---DISCLAIMER---

This script has been created by COMPTEC I.T InfoSec Department (https://www.comptecit.com) to protect its customers in response to the remote code execution (RCE) vulnerability — CVE-2022-30190 (disclosed by Microsoft on May 30th 2022), dubbed as "Follina".
We decided to make it publicly available to contribute to the greater I.T Community; thus, you are free to use it.

COMPTEC I.T is not and can not be held liable by anyone deciding to use this script for their own intended purposes. End Results may vary and may produce different results as expected.
COMPTEC I.T cannot be held accountable for any results it produces. Therefore, we recommend that anyone intending to use this script clearly understand the technical impact this may produce. 
While choosing to run this script, we highly recommend from a technical viewpoint, you complete due diligence and have a full and clear understanding of what you have initiated to run by using the script. 
The script has been tested in our environments, and the results may vary according to your expectations.

---Mitigation Purpose---

The script has been created following Microsoft's workaround published in the Microsoft Security Response Center (https://msrc-blog.microsoft.com/2022/05/30/guidance-for-cve-2022-30190-microsoft-support-diagnostic-tool-vulnerability/olicy). The script disables the MSDT URL Protocol to prevent troubleshooters being launched as links including links throughout the operating system.

---Operating System compatibility---

The script has been tested in Windows Server 2012 R2 to Windows Server 2019 and Windows 10/Windows 11 releases.

---Deployment---

The script can be deployed through either Active Directory Group Policy Management OR Microsoft Endpoint Manager (Intune MDM) OR any other 3rd party software that can push scripts in an environment.

#>

# --- START SCRIPT---

#Temporarily change PowerShell Execution Policy to allow the script to run

Set-ExecutionPolicy Bypass

#Backup the Registry Key to the Documents folder of the User Profile

reg export HKEY_CLASSES_ROOT\ms-msdt c:\users\%username%\Documents

#Delete the Registry Key

reg delete HKEY_CLASSES_ROOT\ms-msdt /f

# --- END SCRIPT---