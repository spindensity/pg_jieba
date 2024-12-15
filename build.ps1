$ErrorActionPreference = "Stop"
Set-StrictMode -Version Latest
$PSNativeCommandUseErrorActionPreference = $true

cmd /c .\_build.bat
sudo cmake --install msvc_build
sudo Restart-Service -Name postgresql-x64-16

Write-Host You need change "shared_preload_libraries" settings in postgresql.conf in
Write-Host your Postgresql data direcotry to contain the "pg_jieba" lib, for excample:
Write-Host shared_preload_libraries = `'pg_jieba`'
Write-Host then restart Postgresql service again.
Write-Host
Write-Host You may also want to set "default_text_search_config" to "public.jiebacfg"
Write-Host in postgresql.conf file.

