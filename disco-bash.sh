#!/bin/bash

# Array of ANSI background color codes for rainbow colors
colors=(41 43 42 46 44 45 101)  # Red, Yellow, Green, Cyan, Blue, Magenta, Light Red

# Function to reset terminal background color
function reset_color {
    echo -e "\033[0m"   # Reset background color to default
    clear               # Clear the screen to apply reset color
    exit 0              # Exit the script
}

# Trap SIGINT (Ctrl + C) to call reset_color function
trap reset_color SIGINT

# Infinite loop to cycle through colors
while true; do
    for color in "${colors[@]}"; do
        # Set background color
        echo -e "\033[${color}m"
        # Clear screen to apply background color
        clear
        # Wait for 0.5 seconds
        sleep 0.05
    done
done
