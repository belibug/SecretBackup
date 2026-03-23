function Export-Secret {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $VaultName,
        [string]
        $OutPath = (Get-Location).Path
    )
    Test-VaultAccess -VaultName $VaultName

    $Data = New-Object -TypeName System.Collections.ArrayList

    $AllSecrets = Get-SecretInfo -Vault $VaultName
    foreach ($Secret in $AllSecrets) {
        if ($Secret.Type -eq 'String' -or $Secret.Type -eq 'SecureString') {
            $Obj = [PSCustomObject]@{
                Name     = $Secret.Name
                Type     = [string]$Secret.Type
                Secret   = Get-Secret -Vault $VaultName -Name $Secret.Name -AsPlainText
                Metadata = $Secret.Metadata #| ConvertTo-Json -Compress
            }
        } elseif ($Secret.Type -eq 'PSCredential') {
            $SecInfo = Get-Secret -Vault $VaultName -Name $Secret.Name -AsPlainText
            $Obj = [PSCustomObject]@{
                Name     = $Secret.Name
                Type     = [string]$Secret.Type
                Secret   = @{
                    UserName = $SecInfo.UserName
                    Password = $SecInfo.Password | ConvertFrom-SecureString -AsPlainText
                }
                Metadata = $Secret.Metadata #| ConvertTo-Json -Compress
            }
        } else {
            'Secret {0} of type {1} is not supported' -f $Secret.Name, $Secret.Type | Write-Warning
        }
        $Data.Add($Obj) | Out-Null
    }
    $outFileName = 'Vault_Backup_{0}.json' -f (Get-Date).ToString('yyyyMMdd_HHmm')
    $outFile = Join-Path -Path $OutPath -ChildPath $outFileName
    $Data | ConvertTo-Json | Out-File -FilePath $outFile
    if ($?) {
        'Successfully exported backup to: {0}' -f $outFile | Write-Host
    } else {
        'Someting went wrong, export failed' | Write-Error
    }
}