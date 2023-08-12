$ErrorActionPreference = "Stop"
write-host "Attempting to stop Hasura CLI"
try
{
  $running = get-process hasura
}
catch
{
  write-host "Nothing to stop"
  $running = @()
}
 
if ($running)
{
  write-host "Stopping Hasura CLI Processes"
  foreach($p in $running)
  {
    stop-process $p
    write-verbose "Stopped $($p.ProcessName) $($p.Id)"
  }
}