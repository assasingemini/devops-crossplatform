# main.ps1
$prefix = "http://*:8080/"
$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($prefix)
$listener.Start()
Write-Host "Listening on $prefix"

try {
  while ($true) {
    $context  = $listener.GetContext()
    $response = $context.Response

    $msg   = "Hello from Windows container!`nOS=$([System.Environment]::OSVersion.VersionString)`n"
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($msg)

    $response.StatusCode  = 200
    $response.ContentType = "text/plain"
    $response.OutputStream.Write($bytes, 0, $bytes.Length)
    $response.Close()
  }
}
finally {
  $listener.Stop()
  $listener.Close()
}
