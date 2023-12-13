## Harjutus 1 - uuri järgnevaid käske

- Alusta PowerShell'i käsurea avamisega ja tutvu põhiliste käskudega nagu `Get-Help`, `Get-Command`, `Get-Process`.
- Õpi, kuidas navigeerida failisüsteemis kasutades käskusid nagu `Set-Location`, `Get-ChildItem`.
 
Vaata, mis versioon Powershellist arvutis on: `$PSVersionTable.PSVersion`
 

Uuri kui palju käske sisaldab sõna dns?

get-command *dns* | measure

Vaata DNS puhvrit:

get-help Get-DnsClientCache

Uuri mida teeb Clear-DNSClientCache
get-help Clear-DnsClientCache 

Tühjenda DNS puhver.
**NB! Selleks, et skriptid arvutis käima läheks, tuleb seadistada execution-policy**
[Vaata täpsemalt](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.4)

Ava powershell admin õigustes ning käivta:

``` powershell 
Set-ExecutionPolicy RemoteSigned
```

## Harjutus 2 - skripti Kirjutamine Failide Korrastamiseks

Kirjuta lihtne skript, mis sorteerib kindlas kaustas olevad failid nende laiendite (näiteks .txt, .jpg) põhjal erinevatesse alamkaustadesse.
Õpi kasutama tsükleid ja tingimuslauseid PowerShell'is.

``` powershell
# loeme välja faililaiendid
$kaustaAsukoht = "C:\Users\demo\Documents\kood\sorteerida"

# Pärime kaustast ainult failid (ilma rekursioonita)
$failidKaustas = Get-ChildItem -Path $kaustaAsukoht -File

# käime tsükkliga läbi kõik failid kaustas
foreach ($fail in $failidKaustas)
{
    # eemaldame substring käsuga faililaiendist punkti
    $failiLaiend = $fail.Extension.Substring(1)

    # testime, kas sellise faililaiendi nimega kataloog on olemas
    if (Test-Path -Path "$($kaustaAsukoht)\$( $failiLaiend)")
    {
        # kaust oli olemas
        write-host  "kaust on olemas - $($failiLaiend)"
    }
    else
    {
        # kausta ei olnud, loome faililaiendi nimega kausta
        New-Item -Path $kaustaAsukoht -Name $failiLaiend -ItemType Directory
    }

    # liigutame faili kausta
    Move-Item -Path $fail.PSPath -Destination "$($kaustaAsukoht)\$( $failiLaiend)"
}
```
**TODO:** proovige iseseisvalt teha versioon, mis tõstab failid alamkaustadest tagasi.
