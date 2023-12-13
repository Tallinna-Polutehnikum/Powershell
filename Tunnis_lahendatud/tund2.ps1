$kataloog = "C:\Users\toivo.admin\Documents"

cd $kataloog

$ipAadressid = Import-Csv -Path ".\ip-tabel.csv" -UseCulture

Measure-Command {
foreach ($ip in $ipAadressid)
{

    try {
      
        $result = Test-Connection -ComputerName $ip.IP -Count 1 -ErrorAction Stop

        "$($ip.ip):ip on kättesaadav"
    } catch {
        # Output error message for unreachable host
        "$($ip.ip):ip pole kättesaadav."
    }

}

}