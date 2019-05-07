$ErrorActionPreference = 'Stop';
$toolsDir          = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exeFileLocation   = Join-Path $toolsDir 'OpenAL11CoreSDK.exe'
$setupFileLocation = Join-Path $toolsDir 'setup-uninstall.iss'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'exe'
  file          = $exeFileLocation
  silentArgs    = "/s /f1`"$($setupFileLocation)`""
  validExitCodes= @(0)
}

$uninstalled = $false
Uninstall-ChocolateyPackage @packageArgs
