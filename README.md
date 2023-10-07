# Intune_Detect_And_Remediations
Custom Intune Detect and Remediation scripts.
<br>Warning: Before use in a production environment, test the scripts first. Use at your own risk

# Disk event finder with toast notification
Detect: This detect script checks the Windows system events to see if disk errors with ID 7 or 52 have been created.
Remediate: Disk event finder with toas notification BurntToast to display a Toast notification on the client with the disk events.
![afbeelding](https://github.com/IntuneAdmin/Intune_Detect_And_Remediations/assets/93092915/9abda0ab-0789-4369-a7de-e5ba7aadc33e)

Intune running Context: 
<br> Run this script using the logged-on credentials set to Yes
<br> Enforce script signature check set to No
<br> Run script in 64-bit PowerShell set to Yes

Github page to BurnToast: https://github.com/Windos/BurntToast


