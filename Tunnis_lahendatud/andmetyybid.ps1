$array = @(1, 2, 3)
$list = new-object system.collections.arraylist

Write-Host $array

$array[0]
$array[2]
$array.Add("tere")

$list.Add("tere")
$list

$hashTable = @{key1 = 'value1'; key2 = 'value2'}
$hashTable.key1
$hashTable | ConvertTo-Json


$chuck = "https://api.chucknorris.io/jokes/random"

$message = Invoke-RestMethod -Uri $chuck -Method Get 
$myjson = $messa

write-host $myjson.value

$message = @{
    message = "Tere maailm"
} | ConvertTo-Json

$headers = @{
    "Content-Type" = "application/json"
}

$url = "https://prod-214.westeurope.logic.azure.com:443/workflows/2cfa60d5745340d79ac49213b69bd03c/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=ywxP-csfzs018HHRPBJs9sjTTCKe7uO8bFpGiA9CbAg"
$response = Invoke-RestMethod -Uri $url -Method Get -Headers $headers -Body $message 
