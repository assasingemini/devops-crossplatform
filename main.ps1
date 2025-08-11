# main.ps1
$prefix = "http://+:8080/"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()
Write-Host "Listening on $prefix"

try {
  while ($true) {
    $ctx  = $listener.GetContext()
    $resp = $ctx.Response
    $msg  = "Hello from Windows container!`nOS=$([System.Environment]::OSVersion.VersionString)`n"
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($msg)
    $resp.StatusCode = 200
    $resp.ContentType = "text/plain"
    $resp.ContentLength64 = $bytes.Length
    $resp.OutputStream.Write($bytes,0,$bytes.Length)
    $resp.OutputStream.Close()
  }
}
catch { Write-Error $_ }
finally { $listener.Stop(); $listener.Close() }
