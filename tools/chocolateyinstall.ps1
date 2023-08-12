$checksum = "3061FB1AE0A1AF1140B3CE83E5A864463D3F2A5DE2B611A38B9453B1E52E8773"
$ErrorActionPreference = 'Stop';
$packageName = 'hasura-cli'
$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
$version = $env:ChocolateyPackageVersion
$url = "https://github.com/hasura/graphql-engine/releases/download/v$version/cli-hasura-windows-amd64.exe"
$checksumtype = "sha256"
$destination = "$toolsPath\cli-hasura-windows-amd64.exe"

if (Test-Path "$toolsPath\hasura.exe") {
  Remove-Item "$toolsPath\hasura.exe"
  Remove-Item "$toolsPath\*.sha256"
  Uninstall-BinFile -Name "hasura" -Path "$toolsPath"
}

Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $destination -Url64bit $url -Checksum64 $checksum -ChecksumType64 $checksumtype

Rename-Item -Path "$toolsPath\cli-hasura-windows-amd64.exe" -NewName "hasura.exe"
Install-BinFile -Name "hasura" -Path "$toolsPath"