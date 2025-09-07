#Get-Process | Where-Object {$_.Name -like "C*"} | Select-Object Name, ID | Format-Table
#Get-Process | Where-Object { $_.Path -and $_.Path -notmatch "system32" } | Select-Object Id, ProcessName, Path
#Get-Service | Where-Object { $_.Status -eq 'Stopped' } | Sort-Object Name | Select-Object Name, DisplayName, Status | Export-csv -Path "stop.csv"
if (Get-Process chrome -ErrorAction SilentlyContinue) {
     Stop-Process -Name chrome
} else {
     Start-Process chrome "https://www.champlain.edu"
}

