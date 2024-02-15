$name = Read-Host "What user do you want to remove?"

Remove-LocalUser -Name "$name"