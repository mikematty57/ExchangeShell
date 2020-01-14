$CSVFile = Import-Csv "UNC"

$data = For ($x=0; $x -lt $CSVFile.Length ; $x++) {
  
    $Identity = $CSVFile[$x].Name

    Get-Mailbox -identity $Identity -resultsize "Unlimited" | Get-MailboxPermission | where { ($_.AccessRights -eq "FullAccess") -and ($_.IsInherited -eq $false) -and -not ($_.User -like "NT AUTHORITY\SELF","CONT\Enterprise Admins","CONT\Domain Admins","CONT\") } | ft @{Name="Identity";expression={($_.Identity -split "/")[-1]}}, User -AutoSize

}

Export-Csv "UNC"


