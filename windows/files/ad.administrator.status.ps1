
Set-ADAccountControl Administrator `
    -PasswordNeverExpires $true `
    -CannotChangePassword $true

Search-ADAccount -UsersOnly -PasswordNeverExpires | where {$_.name -like "administrator"}
