# Define the log name and event IDs for disk errors and warnings
$eventLogName = 'System'
$errorEventID = 7     # The event ID for disk errors
$warningEventID = 52  # The event ID for disk warnings

# Get the latest disk error and warning events from the specified log
$latestErrorEvent = Get-WinEvent -LogName $eventLogName -MaxEvents 1 | Where-Object { $_.Id -eq $errorEventID }
$latestWarningEvent = Get-WinEvent -LogName $eventLogName -MaxEvents 1 | Where-Object { $_.Id -eq $warningEventID }

# Check if there is a recent disk error or warning event
if ($latestErrorEvent -or $latestWarningEvent) {
    # There is a recent disk error or warning event
    Write-Host "Disk issues detected:"
    
    if ($latestErrorEvent) {
        Write-Host "Latest Disk Error Event:"
        $latestErrorEvent | Format-Table -AutoSize
    }
    
    if ($latestWarningEvent) {
        Write-Host "Latest Disk Warning Event:"
        $latestWarningEvent | Format-Table -AutoSize
    }
    
    # Return a custom exit code to indicate an issue (e.g., 1)
    exit 1
    
} else {
    # No recent disk error or warning event
    Write-Host "No recent disk issues detected."
    
    # Return a success exit code to indicate no issues (e.g., 0)
    exit 0
    
}