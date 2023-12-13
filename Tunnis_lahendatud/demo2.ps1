$kataloog = "C:\Users\toivo.admin\Documents"
cd $kataloog

# Import the CSV file
$ipAadressid = Import-Csv -Path ".\ip-tabel.csv" -UseCulture

# Use ForEach-Object with the -Parallel parameter for parallel processing
$ipAadressid | ForEach-Object -Parallel {
    try {
        # Test the connection
        $result = Test-Connection $_.IP -Count 1 -ErrorAction Stop
        # Output success message
        "$($_.IP) is reachable."
    } catch {
        # Output error message for unreachable host
        "$($_.IP) is unreachable."
    }
} -ThrottleLimit 10 # Adjust the ThrottleLimit as needed
