# Powershell

PowerShell on skriptimiskeel, mida kasutatakse peamiselt Windowsi haldaustegevuste automatiseerimiseks, kuid seda saab kasutada ka muude operatsioonisüsteemide jaoks. Järgnev annab ülevaate Powershelli põhikonstruktsioonidest, muutujatest ja andmetüüpidest.

### Tsüklid ja Kontrollstruktuurid

1. **For-tsükkel**
   - Kasutatakse korduva tegevuse teostamiseks kindel arv kordi.
   - Näide: `for ($i = 0; $i -lt 10; $i++) { <# tegevus #> }`

2. **Foreach-tsükkel**
   - Kasutatakse iga elemendi läbimiseks kogumis (näiteks massiivis või nimekirjas).
   - Näide: `foreach ($element in $kogum) { <# tegevus #> }`

3. **While-tsükkel**
   - Jätkab tegevuste kordamist seni, kuni määratud tingimus on tõene.
   - Näide: `while ($tingimus) { <# tegevus #> }`

4. **Do-While-tsükkel**
   - Sarnane while-tsüklile, kuid tagab, et tegevus toimub vähemalt üks kord.
   - Näide: `do { <# tegevus #> } while ($tingimus)`

5. **Do-Until-tsükkel**
   - Jätkab tegevuste sooritamist, kuni tingimus muutub tõeseks.
   - Näide: `do { <# tegevus #> } until ($tingimus)`

### Muutujad

- **Muutuja määratlemine**
  - Muutujad PowerShellis määratakse dollarimärgiga ($).
  - Näide: `$muutujaNimi = "väärtus"`

- **Muutuja tüübi määramine**
  - Tüüpi saab määrata muutuja loomisel.
  - Näide: `[int]$arv = 5`

### Andmetüübid

1. **Primitiivsed Andmetüübid**
   - Int, String, Boolean, Double jne.
   - Näide: `$intMuutuja = 10`, `$stringMuutuja = "Tekst"`

2. **Kogumid**
   - Array, HashTable, List jne.
   - Näide: `$array = @(1, 2, 3)`, `$hashTable = @{key1 = 'value1'; key2 = 'value2'}`

3. **Objektid**
   - PowerShell võimaldab luua ja töötada objektidega, mis koosnevad erinevatest omadustest ja meetoditest.
   - Näide: `$objekt = New-Object -TypeName PSObject`

