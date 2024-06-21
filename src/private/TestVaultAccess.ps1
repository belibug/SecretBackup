function Test-VaultAccess {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $VaultName
    )
    if (-not(Get-Command Test-SecretVault -ErrorAction SilentlyContinue)) {
        'SecretManagement module is not found, aborting' | Write-Error -ErrorAction Stop
    }
    
    Try {
        Test-SecretVault -Name $VaultName -ErrorAction Stop | Out-Null
    } Catch {
        "Unable to access Vault! `n{0}" -f $Error[0] | Write-Error -ErrorAction Stop
    }
}