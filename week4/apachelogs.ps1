function Apachelogs ($page,$code,$name){
    $logs = Get-Content C:\xampp\apache\logs\access.log | Select-String -Pattern "$page" | Select-String -Pattern "$code" | Select-String -Pattern "$name" | ForEach-Object { $_.Line }

    $regex = [regex] "([0-9]{1,3}\.){3}[0-9]{1,3}"
    
    if($logs){
    $joined = $logs -join "'n"
    $ipsUnorganized = $regex.Matches($logs)
    }

    
    $ips = @()
    for($i=0;$i -lt $ipsUnorganized.Count;$i++){
        $ips += [pscustomobject]@{ "IP" = $ipsUnorganized[$i].Value; }
    }
    $ipsoftens = $ips | Where-Object { $_.IP -ilike "10.*" }
    $counts = $ipsoftens | Group-Object IP | Select Name, Count
    return $counts
}