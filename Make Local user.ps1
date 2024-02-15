$password = Read-Host "What should the password be?" -AsSecureString
$name = Read-Host "What name should the user have?"

New-LocalUser -Name $name -Password $password | Add-LocalGroupMember -Group Administrators -Member $name

Get-LocalUser