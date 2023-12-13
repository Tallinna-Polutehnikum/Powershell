$chuck = "https://api.chucknorris.io/jokes/random"

$nali = Invoke-RestMethod -Uri $chuck -Method Get 
$nali = $nali.value

$message = @{
    message = $nali
} | ConvertTo-Json

$headers = @{
    "Content-Type" = "application/json"
}

$url = "https://prod-214.westeurope.logic.azure.com:443/workflows/2cfa60d5745340d79ac49213b69bd03c/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=ywxP-csfzs018HHRPBJs9sjTTCKe7uO8bFpGiA9CbAg"

$response = Invoke-RestMethod -Uri $url -Method Post -Headers $headers -Body $message 