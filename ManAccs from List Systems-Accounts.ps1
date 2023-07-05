$url = "passwordsafe URL"
$apiKey = "key"
$apiuser = "apiuser"


# Define the path to the input CSV file
$inputFilePath = "input.csv"

# Read the input CSV file
$inputData = Import-Csv -Path $inputFilePath

# Execute the command and store the CSV response
$textArrayResponse = .\psrun2 -i $url $apikey $apiuser ListSystems

# Convert the tab-delimited response to an array of objects and select specific columns
$dataArray = $textArrayResponse -split "`n" | ConvertFrom-Csv -Delimiter "`t" | Select-Object -Property ManagedSystemID, HostName

# Iterate over each row in the input data
foreach ($row in $inputData) {
    # Compare the SystemName with the HostName values in the response
    $matchedEntry = $dataArray | Where-Object { $_.HostName -eq $row.SystemName }

    if ($matchedEntry) {
        # Run the command for matching entries
        $ManagedSystemID = $matchedEntry.ManagedSystemID
        $AccountName = $row.AccountName
        .\psrun2 -i $url $apikey $apiuser post "ManagedSystems/$ManagedSystemID/ManagedAccounts" "AccountName=$AccountName"
    }
}
