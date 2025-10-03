function gatherClasses(){

$page = Invoke-WebRequest -Timeout 2 http://10.0.17.13/Courses2025FA.html

$trs=$page.Parsedhtml.body.getElementsbyTagName("tr")

$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){
    
    $tds = $trs[$i].getElementsbyTagName("td")

    $Times = $tds[5].innerText.Split("-")

    $FullTable += [pscustomobject]@{"Class Code" = $tds[0].innerText;
                                    "Title" = $tds[1].innerText;
                                    "Days" = $tds[4].innerText;
                                    "Time Start" = $Times[0];
                                    "Time End" = $Times[1];
                                    "Instructor" = $tds[6].innerText;
                                    "Location" = $tds[9].innerText; }

}

return $FullTable
}


function daysTranslator($FullTable){

for($i=0;$i -lt $FullTable.length; $i++){
    $Days=@()

    if($FullTable[$i].Days -ilike "M*"){ $Days += "Monday"}

    if($FullTable[$i].Days -ilike "*T[W,F,T]*"){ $Days += "Tuesday"}
    ElseIf($FullTable[$i].Days -ilike "T"){ $Days += "Tuesday"}

    if($FullTable[$i].Days -ilike "*W*"){ $Days += "Wednesday"}

    if($FullTable[$i].Days -ilike "*TH*"){ $Days += "Thursday"}

    if($FullTable[$i].Days -ilike "*F"){ $Days += "Friday"}

    $FullTable[$i].Days = $Days
    }
return $FullTable
}


$one = gatherClasses
$two = daysTranslator($one)

#$two | Where-Object {$_.Instructor -ilike "*Furkan*"}

#$two | Where-Object { ($_.Location -eq "JOYC 310") -and ($_.Days -contains "Monday") } |
#       Sort-Object "Time Start" | Select-Object "Time Start", "Time End", "Class Code"

$itsprof = $two | Where-Object { ($_."Class Code" -ilike "SYS*") -or
                             ($_."Class Code" -ilike "NET*") -or
                             ($_."Class Code" -ilike "SEC*") -or
                             ($_."Class Code" -ilike "FOR*") -or
                             ($_."Class Code" -ilike "CSI*") -or
                             ($_."Class Code" -ilike "DAT*") } | Select-Object -Unique "Instructor" | Sort-Object Instructor  

$two | Where-Object { $_.Instructor -in $itsprof.Instructor } |
       Group-Object "Instructor" | Select-Object Count, Name | Sort-Object Count -Descending