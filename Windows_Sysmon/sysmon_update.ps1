$sysinternals_repo = 'download.sysinternals.com'
$sysinternals_downloadlink = 'https://download.sysinternals.com/files/SysinternalsSuite.zip'
$sysinternals_folder = 'C:\Program Files\sysinternals'
$sysinternals_zip = 'SysinternalsSuite.zip'
$sysmonconfig_downloadlink = 'https://raw.githubusercontent.com/ventra007/sysmon-config/master/sysmonconfig-export.xml'
$sysmonconfig_file = 'sysmonconfig-export.xml'

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$OutPath = $env:TMP
$output = $sysinternals_zip
$X += 1
Invoke-WebRequest -Uri $sysmonconfig_downloadlink -OutFile $OutPath\$sysmonconfig_file
$serviceName = 'Sysmon64'
Start-Process -FilePath $sysinternals_folder\Sysmon64.exe -Argumentlist @("-c", "$OutPath\$sysmonconfig_file") -Verb runAs