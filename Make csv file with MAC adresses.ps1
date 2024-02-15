$path = "C:\Users\sebas\Desktop\Serit Powershell\LocalMacs.csv"

$macadress = Get-NetAdapter | select macaddress | Export-CSV -Path $path

get-content $path |
    select -Skip 1 |
    set-content "$file-temp"
move "$file-temp" $path -Force