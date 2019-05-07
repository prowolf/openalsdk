$ErrorActionPreference = 'Stop';
$toolsDir          = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$zipFileLocation   = Join-Path $toolsDir 'OpenAL11CoreSDK.zip'
$exeFileLocation   = Join-Path $toolsDir 'OpenAL11CoreSDK.exe'
$setupFileLocation = Join-Path $toolsDir 'setup-install.iss'
$url        = 'https://www.openal.org/downloads/OpenAL11CoreSDK.zip'
$url64      = $url

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = $url
  url64bit      = $url64

  checksum      = '5FD3F70B0C5C6FCA825692EBA84BC0407C639CC14DC904C6A3154EDAE50CA8E1'
  checksumType  = 'sha256'
  checksum64    = $checksum
  checksumType64= $checksumType

  silentArgs    = "/s /f1`"$($setupFileLocation)`""
  validExitCodes= @(0)
}

Install-ChocolateyZipPackage @packageArgs -file $zipFileLocation
Install-ChocolateyInstallPackage @packageArgs -file $exeFileLocation
