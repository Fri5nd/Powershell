$temp = Import-Csv "C:\Users\sebas\Desktop\Serit Powershell\mac.csv"
$maclist = Import-Csv "C:\Users\sebas\Desktop\Serit Powershell\LocalMacs.csv"

foreach ($r in $temp) {
    foreach ($e in $maclist) {
        if ($r.MacAddress -eq $e.MacAddress) {
            Write-Output "Test"
            return
        }
    }
}