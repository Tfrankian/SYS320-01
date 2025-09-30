#Q1

#Get-EventLog System -Source Microsoft-Windows-WinLogon

#Q2

#$loginouts = Get-EventLog System -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-14)

#$loginoutsTable = @() #Empty the array to fill customly
#for($i=0; $i -lt $loginouts.Count; $i++){
#    $event = ""
#    if($loginouts[$i].InstanceId -eq "7001") {$event="Logon"}
#    if($loginouts[$i].InstanceId -eq "7002") {$event="Logoff"}

#    $user = $loginouts[$i].ReplacementStrings[1]

#    $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
#                                           "id" = $loginouts[$i].InstanceId;
#                                        "Event" = $event;
#                                         "User" = $user | whoami;
#                                         }
#}
#$loginoutsTable

#Q3

#$balls = Read-Host "how many days do you want to go back"

#function scripting ($dayCount){    
#    $loginouts = Get-EventLog system -source Microsoft-Windows-Winlogon -After (Get-Date).AddDays(-$dayCount)

#    $loginoutsTable = @() 
#    for($i=0; $i -lt $loginouts.Count; $i++){
#        $event = ""
#        if($loginouts[$i].InstanceId -eq "7001") {$event="Logon"}
#        if($loginouts[$i].InstanceId -eq "7002") {$event="Logoff"}

#        $user = $loginouts[$i].ReplacementStrings[1]

#       $loginoutsTable += [pscustomobject]@{"Time" = $loginouts[$i].TimeGenerated;
#                                               "id" = $loginouts[$i].InstanceId;
#                                            "Event" = $event;
#                                             "User" = $user | whoami;
#                                             }
#    }
#    $loginoutsTable
#}
#Scripting($balls)

#Q4

#$onoff = Get-EventLog system -source EventLog -After (Get-Date).AddDays(-40) | Where-Object {($_.EventId -eq "6005") -or ($_.EventId -eq "6006")}

#$onofftable = @() 
#for($i=0; $i -lt $onoff.Count; $i++){
#    $event = ""
#    if($onoff[$i].EventId -eq "6005") {$event="Start"}
#    if($onoff[$i].EventId -eq "6006") {$event="Shutdown"}
    
#    $user = $onoff[$i].ReplacementStrings[1]

#    $onofftable += [pscustomobject]@{"Time" = $onoff[$i].TimeGenerated;
#                                        "id" = $onoff[$i].EventId;
#                                     "Event" = $event;
#                                      "User" = "System";
#                                      }
#}
#$onofftable

#Q5

. (Join-Path $PSScriptRoot "idk.ps1")

$Logouts = logs(15)
$Logouts

$shuts = shuts(25)
$shuts

$starts = starts(25)
$starts