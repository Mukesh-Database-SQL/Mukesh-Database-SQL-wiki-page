####################################################################################
####################################################################################
## Script To Measure URL Respnse Times.
## Will Server as a Baseline for URL hit and Response Back
## read all the Urls from Input file and Attempt Connection
## A value of connect time =0 will indicate Failure in connection
## All reported values are in second can be converted into msec if required
##
## Arshad Taqvi 25/09/2024
####################################################################################
####################################################################################
$tmpfile="c:\temp\curltime.txt"
$outputfile="c:\temp\urlresponsetimes.csv"
for ($y='' ;$y.length -le 310000;$y=$y+'y'){ 
   for ($x='' ;$x.length -le 310000;$x=$x+'x'){ 
   #Read from Config File Here 

foreach ( $s in (Get-Content c:\app\beacon\script\uri.txt)) 
{
$sc = $s.Split(",")
$url = $sc[0]
$fileprefix = $sc[1]
$hn=hostname
$t26=(Get-Date -Format "ddMMyyyy")
$t3=Get-Date -Format  "yyyy-MM-dd HH:mm:ss"
#$outputfile = "c:\temp\$($fileprefix)_$($hn)_$($t26).csv"
$outputfile = "//nas-ds//DBCentral//beacon//wrk//url//$($fileprefix)_$($hn)_$($t26).csv"
#$outputfile1 = "c:\temp\SERVERCONNECT_$($hn)_$($t26).csv"
#Issue A Curl Command and Note the Timings
#Make Sure to Use the full Path of Curl else Powershell uses invokes-webrequest which will not hanlde variales and give 
#Substitution Errors
C:\Windows\System32\curl.exe -w "@c:\app\beacon\script\curl.txt"  -o NULL -s $url |  Out-File $tmpfile
#curl -s "infosteward-uat:443/BOE/CMC"
#Get-Content $tmpfile | ForEach-Object { $_.split(" ")[1]}

$connecttime=Get-Content $tmpfile | Select-String -Pattern "time_connect" 
$connecttime=($connecttime -split ":"| Select-String -Pattern "time_connect" -NotMatch)
$nslookuptime=Get-Content $tmpfile | Select-String -Pattern "time_namelookup" 
$nslookuptime=($nslookuptime -split ":"| Select-String -Pattern "time_namelookup" -NotMatch)
$appconnecttime=Get-Content $tmpfile | Select-String -Pattern "time_appconnect" 
$appconnecttime=($appconnecttime -split ":"| Select-String -Pattern "time_appconnect" -NotMatch)
$pretransfertime=Get-Content $tmpfile | Select-String -Pattern "time_pretransfer" 
$pretransfertime=($pretransfertime -split ":"| Select-String -Pattern "time_pretransfer" -NotMatch)
$redirecttime=Get-Content $tmpfile | Select-String -Pattern "time_redirect" 
$redirecttime=($redirecttime -split ":"| Select-String -Pattern "time_redirect" -NotMatch)
$starttranstime=Get-Content $tmpfile | Select-String -Pattern "time_starttransfer" 
$starttranstime=($starttranstime -split ":"| Select-String -Pattern "time_starttransfer" -NotMatch)
$totaltime=Get-Content $tmpfile | Select-String -Pattern "time_total" 
$totaltime=($totaltime -split ":"| Select-String -Pattern "time_total" -NotMatch)


##Remove Blank Spaces 

$connecttime = $connecttime -replace '\s',''
$nslookuptime = $nslookuptime -replace '\s',''
$appconnecttime = $appconnecttime -replace '\s',''
$pretransfertime = $pretransfertime -replace '\s',''
$redirecttime = $redirecttime -replace '\s',''
$starttranstime =$starttranstime -replace '\s',''
$totaltime = $totaltime -replace '\s',''

####Convert String to Decimal and Second to MilliSecond
$connecttime=[decimal]$connecttime * 1000
$nslookuptime = [decimal]$nslookuptime * 1000
$appconnecttime = [decimal]$appconnecttime * 1000
$pretransfertime = [decimal]$pretransfertime * 1000
$redirecttime = [decimal]$redirecttime * 1000
$starttranstime = [decimal]$starttranstime * 1000 
$totaltime = [decimal]$totaltime * 1000


echo "$fileprefix,$t3,$url,$connecttime,$nslookuptime,$appconnecttime,$pretransfertime,$redirecttime,$starttranstime,$totaltime,$hn" | out-file $outputfile -Append
}
Start-Sleep -Milliseconds 300000
}
}