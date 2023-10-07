Install-Module -Name BurntToast -Force
function Show-Notification {
    param (
        [string]$EventMessage
    )

   # Import the BurntToast module
   Import-Module BurntToast

    # Display a notification
    New-BurntToastNotification -AppLogo 'C:\Path\To\Your\Logo.png' -Text $EventMessage
}


# Define the log name and event IDs for disk errors and warnings
$eventLogName = 'System'
$errorEventID = 7     # The event ID for disk errors
$warningEventID = 52  # The event ID for disk warnings

# Check if there is a recent disk error or warning event
$latestErrorEvent = Get-WinEvent -LogName $eventLogName -MaxEvents 1 | Where-Object { $_.Id -eq $errorEventID }
$latestWarningEvent = Get-WinEvent -LogName $eventLogName -MaxEvents 1 | Where-Object { $_.Id -eq $warningEventID }

if ($latestErrorEvent -or $latestWarningEvent) {
    # There is a recent disk error or warning event
    $eventMessage = "Disk issues have been found!" + [Environment]::NewLine + "Contact IT support on 0118 999 881 999 119 725 3"
    
       
    # Display the graphical notification
    Show-Notification -EventMessage $eventMessage
}
