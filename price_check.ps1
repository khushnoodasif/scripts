$contract_lengths = @("36", "30", "24", "18", "12")

while ($true) {
    $price = Read-Host "What is the original price of the item? (Enter '0' to quit) "
    if ($price -eq 0) {
        break
    }

    $sdcd_36 = 0.9 * $price
    $sdcd_30 = 1.2 * $sdcd_36 - 1.8
    $sdcd_24 = 1.5 * $sdcd_36 - 4.4
    $sdcd_18 = 2 * $sdcd_36 - 9
    $sdcd_12 = 3 * $sdcd_36 - 18

    $sdcd_36 = "{0:0.00}" -f $sdcd_36
    $sdcd_30 = "{0:0.00}" -f $sdcd_30
    $sdcd_24 = "{0:0.00}" -f $sdcd_24
    $sdcd_18 = "{0:0.00}" -f $sdcd_18
    $sdcd_12 = "{0:0.00}" -f $sdcd_12

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
