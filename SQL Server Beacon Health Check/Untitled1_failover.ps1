Invoke-Sqlcmd -h-1 -ServerInstance SE847SSDSPAO02\SECRDX01 -Database dba_maintenance -Query "SELECT @@SERVERNAME"  #| out-file "c:\temp\a.txt"
$ab=Select-String -Path c:\temp\a.txt -Pattern 'PRD'

echo $ab



$ss=(Select-String -Path "C:\temp\a.txt" -Pattern "PRD")
echo $ss



$Gettext = Get-ChildItem C:\temp\a.txt 
 
Foreach ($text in $Gettext){
$txtline = Get-Content -Path $text 
 
    Foreach($line in $txtline){
        $line1 = $line | select-string -Pattern  'PRD'
        $line1
    }
}


$userLoginEntry = Select-String -InputObject $as -Pattern "M847"
echo $userLoginEntry
$aa=(Select-String -Path c:\temp\a.txt -Pattern 'PRD')
echo $aa

$aa= $as | select -Skip 1
echo $aa

$SecondLine = ($as -split "`n")[2]

echo $SecondLine


$filteredOutput = $as | Where-Object { $_ -notlike "Column*" }


echo $filteredOutput

search pattern


Invoke-Sqlcmd -OutputAs DataRows -ServerInstance SE847SSDSPAO02\SECRDX01 -Database dba_maintenance -Query "SELECT @@SERVERNAME"
$logContent = "ERROR: Failed to connect to database.
INFO: User 'admin' logged in.
WARNING: Disk space low on drive C:."

# Search for "ERROR" in the log content
Select-String -InputObject $logContent -Pattern "ERROR"

# Search for "User" and store the result
$userLoginEntry = Select-String -InputObject $logContent -Pattern "User"
$userLoginEntry.Line # Access the matched line content