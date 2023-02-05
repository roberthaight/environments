

$start= get-date

$PsDefaultParameterValues = @{ 
    #ConvertTo-Csv & Export-Csv
    '*-Csv:NoTypeInformation'     = $True
    '*-Csv:Encoding'              = 'UTF8'
    
    #Format-Table
    'Format-Table:Wrap'           = $False
    'Format-Wide:AutoSize'           = $True
    
    #Invoke-Item
    'Invoke-Item:Path'            = '.'

    #Get-ChildItem
    'Get-ChildItem:Force' = $true
}

#Setting Colors
$host.PrivateData.ErrorForegroundColor = 'Red'
$host.PrivateData.ErrorBackgroundColor = 'white'
$host.PrivateData.WarningForegroundColor = 'Yellow'
$host.PrivateData.WarningBackgroundColor = 'Black'
$host.PrivateData.DebugForegroundColor = 'Yellow'
$host.PrivateData.DebugBackgroundColor = 'Black'
$host.PrivateData.VerboseForegroundColor = 'Yellow'
$host.PrivateData.VerboseBackgroundColor = 'Black'
$host.PrivateData.ProgressForegroundColor = 'Yellow'
$host.PrivateData.ProgressBackgroundColor = 'DarkCyan'

#Alias and Mappings
New-PSDrive -Name "Dev" -PSProvider "FileSystem" -Root "C:\Users\robert\documents\dev"
new-alias nuget C:\nuget.exe

#go to the powershell directory on H
set-location Dev:

function Request-Directory { 
    param([Parameter(Mandatory=$True)][string]$Path)
    if (-not (Test-Path -Path $path)) { New-Item -Type Directory -Path $Path -ErrorAction Stop }
    else { Get-Item -Path $Path }
}

Write-Output ("PowerShell {0} {1}" -f $PSVersionTable.PSEdition, $PsVersionTable.PSVersion.ToString())
#Write-Output ("{0} started session on {1} at {2}`n" -f $currentPrincipal.Identity[0].Name, $Env:COMPUTERNAME, ($start.ToString('yyyy-MM-dd HH:mm:ss')))
Try {
    $dir = Request-Directory -Path "$env:userprofile\Powershell_Transcripts\"
    $global:transcript= Join-Path -Path $dir.FullName -ChildPath "Powershell_transcript.$Env:COMPUTERNAME.$($start.ToString('yyyyMMddHHmmssfffffff')).txt"
    [void](Start-Transcript -Path $global:Transcript)
} Catch { Write-Host "NO TRANSCRIPT STARTED - $($PsItem.Exception.Message)" }

Invoke-Expression (&starship init powershell)