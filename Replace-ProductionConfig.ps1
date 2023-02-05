

If (-not (get-psdrive dev)) {
    Write-Error 'Cannot find DEV: PSdrive, you must define this first'
    BREAK
}

#VScode settings.json
copy-item  Dev:\environments\vscode\settings.json $env:appdata\code\User\

#Startship.rs settings.toml file
copy-item  Dev:\environments\starship.toml $env:userprofile\.config\

#Powershell Microsoft.PowerShell_profile.ps1
copy-item  Dev:\environments\Microsoft.PowerShell_profile.ps1 $profile

copy-item Dev:\environments\windowsterminal\settings.json $env:userprofile\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\
