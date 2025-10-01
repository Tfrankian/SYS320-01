﻿#Get-Content C:\xampp\apache\logs\access.log

#Get-Content C:\xampp\apache\logs\access.log -tail 5

#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 ',' 400 '

#Get-Content C:\xampp\apache\logs\access.log | Select-String ' 200 ' -NotMatch

#$A = Get-ChildItem -Path "C:\xampp\apache\logs\*.log" | Select-String -Pattern 'error'
#$A[-5..-1]

#$notfounds = Get-Content C:\xampp\apache\logs\access.log | Select-String ' 404 '

#$regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"

#$ipsUnorganized = $regex.Matches($notfounds)

#$ips = @()
#for($i=0;$i -lt $ipsUnorganized.Count;$i++){
#    $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
#}
#$ips | Where-Object { $_.IP -ilike "10.*" }

$ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
$counts = $ipsoftens | Group-Object IP
$counts | Select-Object Count, Name