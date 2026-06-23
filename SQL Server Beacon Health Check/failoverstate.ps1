<#
    Script : Beacon Script For SQL Oracle To Check If Failover has Taken Place.
             Find The Active Node in Cluster and Report
             Arshad Taqvi 24/07/2025
   #>


   #Capture Active Node in SQL Server. Put in Long Loop

   for ($y='' ;$y.length -le 310000;$y=$y+'y'){ 
   for ($x='' ;$x.length -le 310000;$x=$x+'x'){ 
   #Read from Config File Here 
foreach ( $s in (Get-Content c:\temp\ha.txt)) 
{
   #read Input File Containing Cluster/HA Database
   $sc = $s.Split(",")
   $SQLServer = $sc[0]
   $db=$sc[1]
   $fileprefix=$sc[2]
   $query=$sc[3]
   $hn=hostname
######Mail Alert


#Handle \ here difficult passing it as query

$delimiter = "\"
$index = $SqlServer.IndexOf($delimiter)
$sname=$Sqlserver.Substring(0, $index)

$sendMailMessageBeacon = @{
    To = 'os-is-dddataengineering@brisbane.qld.gov.au'
    SmtpServer='smtp.bcc.qld.gov.au'
    From = '$($hn)@bcc.qld.gov.au'
    Subject = "Unable to Connect To SqlServer ----> $SQLServer "
    Body = "Database $SQLServer Instance $SQLServer Connectivity Issue"
       Priority = 'High'
}
$t26=(Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff")
$t27=(Get-Date -Format "ddMMyyyy")
#$outputfile = "//nas-ds//DBCentral//beacon//wrk//sqlserver//$($fileprefix)_$($hn)_$($t26).csv"
#$outputfile1 = "//nas-ds//DBCentral//beacon//wrk//sqlserver//SERVERCONNECT_$($hn)_$($t26).csv"
$outtempfile = "C:\temp\as.txt"
$outtempfile1 = "C:\temp\at.txt"
$t3=Get-Date -Format  "yyyy-MM-dd HH:mm:ss"
   Invoke-Sqlcmd  -ServerInstance $SQLServer -Database dba_maintenance -Query "select serverProperty('ComputerNamePhysicalNetBios')" | out-file $outtempfile
   $ss=$?
   if ( $ss -eq $false )
  { Send-MailMessage @sendMailMessageBeacon }

<#$Gettext = Get-ChildItem $outtempfile 
 
Foreach ($text in $Gettext)
    {
    $txtline = Get-Content -Path $text 
 
        Foreach($line in $txtline)
            {
                $line1 = $line | select-string -Pattern  'PRD'
                echo $line1
                #Compare the Current Value to the The Previous Primary And If Different Will Indiacte a Failover
                   #$line2=$line1.Substring(0,$line1.IndexOf("."))
            }
    }#>

#Keep It Simple as We expect One Value Only
$line=Get-Content $outtempfile | Select-String -Pattern "M" -CaseSensitive
#Get the Value Of Last Known Primary Server
Invoke-Sqlcmd  -ServerInstance m903prd1 -Database database_central -Query "select Primary_host  FROM [BeaconMetrics].[dbo].[Cluster_State] where reported_date = (select max(Reported_Date) FROM [BeaconMetrics].[dbo].[Cluster_State] where Instance ='$SqlServer')" | out-file $outtempfile
#Invoke-Sqlcmd  -ServerInstance m903prd1 -Database database_central -Query "'$query'" | out-file $outtempfile

$line1=Get-Content $outtempfile | Select-String -Pattern "M"  -CaseSensitive

###Handle String - Blank Spaces New Lines
$line3=$line -replace " ", "" 
$line3 = $line3 -replace "`n", ""
$line4=$line1 -replace " ", "" 


#Now Compare Old and Current Primary Host and Report
    if ($line3 -ne $line4)
    {
    #If We reach Here Means that Failover Has Happened. Insert a record to update last known primary host
    Invoke-Sqlcmd  -ServerInstance m903prd1 -Database BeaconMetrics -Query "Insert into [BeaconMetrics].[dbo].[Cluster_State] values ('$SQLServer','$line','$t26')"
    Invoke-Sqlcmd  -ServerInstance m903prd1 -Database BeaconMetrics -Query "Insert into [BeaconMetrics].[dbo].[Report_failover] values ('FailOverReported','$SQLServer','$line4','$line3','$t26')"

    }

                    }


#Now Report For Oracle
foreach ( $s in (Get-Content c:\temp\haoracle.txt)) 
{
   #read Input File Containing Cluster/HA Database
   $sc = $s.Split(",")
   $SQLServer = $sc[0]
   $db=$sc[1]
   $fileprefix=$sc[2]
   $query=$sc[3]
   $hn=hostname
######Mail Alert


#Handle \ here difficult passing it as query

#$delimiter = "\"
#$index = $SqlServer.IndexOf($delimiter)
#$sname=$Sqlserver.Substring(0, $index)

$sendMailMessageBeacon = @{
    To = 'os-is-dddataengineering@brisbane.qld.gov.au'
    SmtpServer='smtp.bcc.qld.gov.au'
    From = '$($hn)@bcc.qld.gov.au'
    Subject = "Unable to Connect To Oracle Database ----> $SQLServer "
    Body = "Database $SQLServer Instance $SQLServer Connectivity Issue"
       Priority = 'High'
}
$t26=(Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff")
$t27=(Get-Date -Format "ddMMyyyy")
#$outputfile = "//nas-ds//DBCentral//beacon//wrk//sqlserver//$($fileprefix)_$($hn)_$($t26).csv"
#$outputfile1 = "//nas-ds//DBCentral//beacon//wrk//sqlserver//SERVERCONNECT_$($hn)_$($t26).csv"
$outtempfile = "C:\temp\as.txt"
$outtempfile1 = "C:\temp\at.txt"
$t3=Get-Date -Format  "yyyy-MM-dd HH:mm:ss"
}

                    Start-Sleep -Milliseconds 100000
                    }
   }