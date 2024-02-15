Clear-Host
Get-NetAdapter | 
ForEach-Object {
        $PSitem | 
            Select-Object -Property Name, 
            MacAddress,  LinkSpeed,
            @{
                Name       = 'IPAddress'
                Expression = {(Get-NetIPAddress -InterfaceIndex ($PSItem).ifindex).IPv4Address}
            }
} | 
Format-Table -AutoSize