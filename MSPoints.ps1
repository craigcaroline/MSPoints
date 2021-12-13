Clear-Host

for ($a = 0; $a -lt 30; $a++) {
   $RandomWord = (48..57) + (65..90) + (97..122) | Get-Random -Count 1 | ForEach-Object {[char]$_}
   $RandomQuestion = Get-Random -InputObject("What+is+","Definition+of+","Pronunciation+of+","Thesaurus+","Examples+of+","prefixes+for+","suffixes+for+")
   Start-Process "microsoft-edge:http://www.bing.com/search?q=$RandomQuestion$RandomWord"  -WindowStyle Minimized
   start-sleep -Milliseconds 1000
   #$CP = Get-Process -Name MicrosoftEdgeCP | Select-Object -ExpandProperty Processname
   #Stop-Process -Name msedge -Force -PassThru
}

$CP = Get-Process -Name msedge | Select-Object -ExpandProperty Processname


while ($cp.count -gt 0) {
    Stop-Process -Name msedge -Force -PassThru
    Start-Sleep -Milliseconds 200
    $CP = Get-Process -Name msedge -ErrorAction SilentlyContinue | Select-Object Processname
}
