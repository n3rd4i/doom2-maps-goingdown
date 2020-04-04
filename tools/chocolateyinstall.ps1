$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
. "$toolsDir\commonEnv.ps1"

$url        = 'ftp://ftp.fu-berlin.de/pc/games/idgames/levels/doom2/Ports/megawads/gd.zip'
$unzipLocation = "$(Join-Path $toolsDir wad)"
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $unzipLocation
  url           = $url
  checksum      = '48ACCAC85AF296534565E4C6CBC4CB7312E70756012C327B3D7C1C14C9872DC9'
  checksumType  = 'sha256'
}
Install-ChocolateyZipPackage @packageArgs

# Cleanup link first (safely)
& $ENV:COMSPEC /C IF EXIST $wad_lnk DEL /S /Q $wad_lnk

# Install symbolic link for later use
$wad_src = "$(Join-Path $unzipLocation $wad)"
& $ENV:COMSPEC /C MKLINK $wad_lnk $wad_src
