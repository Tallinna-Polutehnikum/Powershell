# Define a workflow
workflow Test-IPConnections {
    param (
        [string[]]$IPAddresses
    )

    # Use ForEach -Parallel for parallel processing
    foreach -parallel ($ip in $IPAddresses) {
        InlineScript {
            try {
                # Test the connection
                $result = Test-Connection -ComputerName $using:ip -Count 1 -ErrorAction Stop
                # Output success message
                "$using:ip is reachable."
            } catch {
                # Output error message for unreachable host
                "$using:ip is unreachable."
            }
        }
    }
}

# Main script
$kataloog = "C:\Users\toivo.admin\Documents"
Set-Location $kataloog

# Import the CSV file
$ipAadressid = Import-Csv -Path ".\ip-tabel.csv" -UseCulture

# Extract IP addresses from the CSV
$ipList = $ipAadressid.IP

# Call the workflow

Measure-Command {Test-IPConnections -IPAddresses $ipList }
