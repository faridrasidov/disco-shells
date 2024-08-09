# Save current colors
$currentBgColor = $Host.UI.RawUI.BackgroundColor
$currentFgColor = $Host.UI.RawUI.ForegroundColor

# Rainbow colors array
$colors = @(
    "DarkRed", "DarkYellow", "Green", "Cyan", "Blue", "DarkMagenta", "Magenta"
)

# Function to reset colors when exiting
function Reset-Colors {
    $Host.UI.RawUI.BackgroundColor = $currentBgColor
    $Host.UI.RawUI.ForegroundColor = $currentFgColor
    Clear-Host
    Write-Host "Terminal colors restored to their original state."
}

# Register Ctrl + C (SIGINT) event to call Reset-Colors
$onExitEvent = {
    Reset-Colors
    exit
}
Register-EngineEvent PowerShell.Exiting -Action $onExitEvent
Register-EngineEvent Console.CancelKeyPress -Action $onExitEvent

# Main loop
try {
    while ($true) {
        foreach ($color in $colors) {
            # Change background color
            $Host.UI.RawUI.BackgroundColor = $color
            Clear-Host  # Apply the new background color
            # Wait for 0.05 seconds
            Start-Sleep -Milliseconds 50
        }
    }
} finally {
    # Ensure reset happens if exiting loop in any way
    Reset-Colors
}
