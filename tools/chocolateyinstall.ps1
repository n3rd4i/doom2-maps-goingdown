$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/Ports/megawads/gd.zip'
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$(Join-Path $toolsDir wad)"
  url           = $url
  softwareName  = 'doom2-maps-goingdown*'
  checksum      = '48ACCAC85AF296534565E4C6CBC4CB7312E70756012C327B3D7C1C14C9872DC9'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs
