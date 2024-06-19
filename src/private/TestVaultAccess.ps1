function Test-VaultAccess {
    [CmdletBinding()]
    param (
        [Parameter()]
        [string]
        $VaultName
    )
    #TODO check if secret module is installed
    
    Try {
        Test-SecretVault -Name $VaultName -ErrorAction Stop | Out-Null
    } Catch {
        "Unable to access Vault! `n{0}" -f $Error[0] | Write-Error -ErrorAction Stop
    }
}