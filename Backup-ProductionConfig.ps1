

If (-not (get-psdrive dev)) {
    Write-Error 'Cannot find DEV: PSdrive, you must define this first'
    BREAK
}

if (-not (Test-Path Dev:\Enviroments)) {
    New-Item Dev:\Enviroments -ItemType Directory
}
if (-not (Test-Path Dev:\environments\vscode)) {
    New-Item Dev:\environments\vscode\ -ItemType Directory
}
if (-not (Test-Path Dev:\environments\windowsterminal)) {
    New-Item Dev:\environments\windowsterminal -ItemType Directory
}


#VScode settings.json
copy-item $env:appdata\code\User\settings.json Dev:\environments\vscode\

#Startship.rs settings.toml file
copy-item $env:userprofile\.config\starship.toml Dev:\environments\

#Powershell Microsoft.PowerShell_profile.ps1
copy-item $profile Dev:\environments\

copy-item $env:userprofile\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json Dev:\environments\windowsterminal
