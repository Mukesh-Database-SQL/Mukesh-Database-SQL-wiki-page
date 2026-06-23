####################################################################################
####################################################################################
##  Beacon Script for SQL Server
##  Purpose Check if the sql ports are reachable or not
##  Record Query Execution Time - Arshad Taqvi 20/09/2024
##  Modify the Commnad to Handle Failure Correctly -Arshad Taqvi 23/09/2024
##  Modify To Send Alert Mails When connection Fails  - Arshad Taqvi 08/10/2024
##  Modify To Prevent Alert MAils During Scheduled Downtime - Arshad Taqvi 22/10/2024
####################################################################################
####################################################################################
for ($y='' ;$y.length -le 310000;$y=$y+'y'){ 
   for ($x='' ;$x.length -le 310000;$x=$x+'x'){ 
   #Read from Config File Here 
foreach ( $s in (Get-Content c:\app\beacon\script\sqlbeacon.txt)) 
{

$sc = $s.Split(",")
$SQLServer = $sc[0]
$db3 = $sc[1]
$qcd = $sc[2]
$ports= $sc[3]
$fileprefix=$sc[4]
$sqlhost=$sc[5]
$hn=hostname
echo $SQLServer
######Mail Alert

$sendMailMessageBeacon = @{
    To = 'os-is-dddataengineering@brisbane.qld.gov.au'
    SmtpServer='smtp.bcc.qld.gov.au'
    From = 'm903prd1@bcc.qld.gov.au'
    Subject = "Unable to Connect To SqlServer ----> $SQLServer "
    Body = "Database $db3 Instance $SQLServer Connectivity Issue"
       Priority = 'High'
}
$t26=(Get-Date -Format "ddMMyyyy")
$outputfile = "//nas-ds//DBCentral//beacon//wrk//sqlserver//$($fileprefix)_$($hn)_$($t26).csv"
$outputfile1 = "//nas-ds//DBCentral//beacon//wrk//sqlserver//SERVERCONNECT_$($hn)_$($t26).csv"
$t3=Get-Date -Format  "yyyy-MM-dd HH:mm:ss"
$t=[Math]::Round((Get-Date).ToFileTime()/10000)
if ((Test-NetConnection -ComputerName $($sqlhost) -port $($ports)).TcpTestSucceeded )
{ $t1=[Math]::Round((Get-Date).ToFileTime()/10000)
  $t2=$t1-$t
  echo "$($fileprefix),$t3,$t2,$hn,SUCCESS,$SQLSERVER,$ports " | Out-File $outputfile1 -Append
  $t3=Get-Date -Format  "yyyy-MM-dd HH:mm:ss"
    $t=[Math]::Round((Get-Date).ToFileTime()/10000)

Invoke-Sqlcmd -ServerInstance $($SQLServer) -Database $($db3) -Query $($qcd) 
$as=$?
$t1=[Math]::Round((Get-Date).ToFileTime()/10000)
  $t2=$t1-$t
 ###Make Sure Invokecm is successfull Else Assign t2 = 100000
  if ( $as -eq $false )
  { $t2=100000
  Send-MailMessage @sendMailMessageBeacon }
  echo "$($fileprefix),$t3,$t2,$hn,$db3,$SQLSERVER " | Out-File $outputfile -Append
}
else

{ echo "$($fileprefix),$t3,$t2,$hn,FAILURE,$SQLSERVER,$ports " | Out-File $outputfile1 -Append
$TD=(Get-Date).DayOfWeek
$TH=Get-Date -Format HH
$THH=[int]$TH
#
#echo $TD $TH
#Azure Servers are shutdown Weekends and after Business Hours
#So do not trigger Mail. Later when Prods are Migrated will Tweak to Generate alerts 
#for Prod 24x7 Provided they remain Up. At the time of writing do not have visiility for Prod. Arshad Taqvi
if (($TD -ne "Sunday" ) -and ($TD -ne "Saturday"))
{
if (($THH -gt 7) -and ($THH -lt 18)) 
{
 Send-MailMessage @sendMailMessageBeacon
}
}
 
}
}


#$ports | ForEach-Object {$port = $_; if (Test-NetConnection -ComputerName m903prd1 -Port $port -InformationLevel Quiet -WarningAction SilentlyContinue) {"Port $port is open" } else {"Port $port is closed"} }



#if (Test-NetConnection -ComputerName m903prd1 -port 1433 ) { 
#echo "Arshad"
#}
Start-Sleep -Milliseconds 300000
}
}