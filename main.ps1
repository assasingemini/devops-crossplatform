 = "http://*:8080/"
 = New-Object System.Net.HttpListener
.Prefixes.Add()
.Start()
while (True) {
   = .GetContext()
   = .Response
   = "Hello from Windows container!
"
   = [System.Text.Encoding]::UTF8.GetBytes()
  .StatusCode = 200
  .ContentType = "text/plain"
  .OutputStream.Write(, 0, .Length)
  .Close()
}