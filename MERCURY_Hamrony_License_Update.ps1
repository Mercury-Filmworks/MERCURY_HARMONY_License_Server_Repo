# Path to the text file containing the list of machines
$machineListFile = "C:\Users\iand\Documents\GitHub\MERCURY_Harmony_License_Server\machine_list.csv"

# The file to look for on each machine
$filePath = "C:\folder\file.dat"
# The line to search for and the replacement text
$searchText = "hermes"
$replaceText = "hermes2"

# Read the list of machines from the file
$machines = Get-Content -Path $machineListFile

# Loop through each machine
foreach ($machine in $machines) {
    # Check if the machine is accessible
    if (Test-Connection -ComputerName $machine -Count 1 -Quiet) {
        # Construct the remote file path
        $remoteFilePath = "\\$machine\C$\flexlm\license.dat"
        
        # Check if the file exists
        if (Test-Path $remoteFilePath) {
            Write-Host "File found on $machine. Modifying the file."

            # Read the file content
            $fileContent = Get-Content -Path $remoteFilePath

            # Replace the line of text
            $fileContent = $fileContent -replace $searchText, $replaceText

            # Write the modified content back to the file
            Set-Content -Path $remoteFilePath -Value $fileContent
            Write-Host "File modified on $machine."
        } else {
            Write-Host "File not found on $machine."
        }
    } else {
        Write-Host "Machine $machine is not accessible."
    }
}
