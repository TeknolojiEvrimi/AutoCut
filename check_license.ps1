param([string]$key)

$url="https://raw.githubusercontent.com/TeknolojiEvrimi/AutoCut/main/licenses.txt"

try{

$data=(Invoke-WebRequest $url).Content -split "`n"

foreach($line in $data){

$parts=$line.Trim() -split "|"

if($parts[0] -eq $key){

$expire=[datetime]$parts[1]

if((Get-Date) -le $expire){
Write-Host "VALID"
exit
}else{
Write-Host "EXPIRED"
exit
}

}

}

Write-Host "INVALID"

}catch{

Write-Host "ERROR"

}
