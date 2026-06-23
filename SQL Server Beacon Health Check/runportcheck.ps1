###############################################################
##Script to check TCP/UDP Ports
## Input file contains Server Port and Port Type
## Arshad Taqvi 01/10/2024
################################################################


foreach ( $s in (Get-Content c:\app\beacon\script\ports.txt)) 
{

$sc = $s.Split(",")
$SQLServer = $sc[0]
$type = $sc[1]
$ports = $sc[2]
$hn=hostname
if ( $type -eq "tcp")
{$par1="-TCP:$true"
c:\app\beacon\script\TestPort.ps1 -comp $SQLServer -port $ports -tcp}
else
{$par1="-TCP:$false"
c:\app\beacon\script\TestPort.ps1 -comp $SQLServer -port $ports -udp}


#c:\app\beacon\script\TestPort.ps1 -comp $SQLServer -port $ports "$par1"
}


#c:\app\beacon\script\TestPort.ps1 -comp SE868SSDSUAO02 -port 3389 -tcp