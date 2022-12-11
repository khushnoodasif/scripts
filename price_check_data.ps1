# Import CSV file as a hashtable
$prices = Import-Csv -Path './prices.csv' -Header 'Device', 'SDCD' -Delimiter ','

# Set contract lengths
$contract_lengths = @("36", "30", "24", "18", "12")

# Print list of available devices
Write-Host "Available devices:"
for ($i = 0; $i -lt $prices.Count; $i++) {
    Write-Host "$($i + 1): $($prices.Device[$i])"
}

while ($true) {
    # Prompt user for device number
    $device_number = Read-Host "Enter the number of the device you want (or '0' to quit): "
    if ($device_number -eq 0) {
        # Exit the loop if the user enters 0
        break
    }
    elseif ($device_number -lt 1 -or $device_number -gt $prices.Count) {
        # Handle invalid input
        Write-Host "Invalid input. Please try again."
        continue
    }

    Write-host "Selected device: $($prices.Device[$device_number - 1])"

    # Look up the original price for the selected device
    $price = $prices[$device_number - 1].SDCD

    # Calculate SDCD for each contract length
    $sdcd_36 = 0.9 * $price
    $sdcd_30 = 1.2 * $sdcd_36 - 1.8
    $sdcd_24 = 1.5 * $sdcd_36 - 4.4
    $sdcd_18 = 2 * $sdcd_36 - 9
    $sdcd_12 = 3 * $sdcd_36 - 18

    # Format SDCD values as currency
    $sdcd_36 = "{0:0.00}" -f $sdcd_36
    $sdcd_30 = "{0:0.00}" -f $sdcd_30
    $sdcd_24 = "{0:0.00}" -f $sdcd_24
    $sdcd_18 = "{0:0.00}" -f $sdcd_18
    $sdcd_12 = "{0:0.00}" -f $sdcd_12

    # Print SDCD for each contract length
    foreach ($contract_length in $contract_lengths) {
        if ($contract_length -eq "36") {
            Write-Host "$($sdcd_36) for 36 months"
        }
        elseif ($contract_length -eq "30") {
            Write-Host "$($sdcd_30) for 30 months"
        }
        elseif ($contract_length -eq "24") {
            Write-Host "$($sdcd_24) for 24 months"
        }
        elseif ($contract_length -eq "18") {
            Write-Host "$($sdcd_18) for 18 months"
        }
        elseif ($contract_length -eq "12") {
            Write-Host "$($sdcd_12) for 12 months"
        }
    }
}