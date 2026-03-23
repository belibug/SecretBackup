function Import-Secret {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string]
        $VaultName,
        [Parameter(Mandatory)]
        [string]
        $BackupFile,
        [switch]
        $OverWrite
    )
    Test-VaultAccess -VaultName $VaultName
    # Test-ValidJSONInput -JSONFile $BackupFile
    $RestoredCount = 0
    $JSONData = Get-Content -Path $BackupFile -Raw | ConvertFrom-Json
    foreach ($Secret in $JSONData) {
        if (Get-SecretInfo -Vault $VaultName -Name $Secret.Name) {
            $SecretExists = $true
        } else {
            $SecretExists = $false
        }
        if (-not $SecretExists -or $OverWrite) {
            $Metadata = $Secret.Metadata | ConvertTo-Json | ConvertFrom-Json -AsHashtable
            if ($Secret.Type -eq 'String' -or $Secret.Type -eq 'SecureString') {
                Set-Secret -Vault $VaultName -Name $Secret.Name -Secret $Secret.Secret -Metadata $Metadata
                $RestoredCount ++
            } elseif ($Secret.Type -eq 'PSCredential') {
                $username = $Secret.Secret.UserName
                $password = $Secret.Secret.Password | ConvertTo-SecureString -AsPlainText
                $credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $password
                Set-Secret -Vault $VaultName -Name $Secret.Name -Secret $credential -Metadata $Metadata
                $RestoredCount ++
            } 
        }
    }
    "Imported $RestoredCount secrets" | Write-Host
}