# PowerShell Secret Store Backup & Restore Module

This PowerShell module offers essential functionality for backing up (exporting as JSON) and restoring the PowerShell Secret Store. Designed to complement the [SecretManagement][SecretManagementGithub] module, it supports any compatible store extension. 

- Provides Cross-platform capability to  backup and restore (e.g., Windows to Mac) Secrets. 
- Migrate secrets from one store backend to different one. (e.g., KeePass to AzureVault Migration).

> [!IMPORTANT]
> Currently it supports secret saved as string, securestring and PSCredential only

## Features

- Export PowerShell Secret Store as plain JSON
- Restore PowerShell Secret Store from JSON

## Installation

To install the module, you can use the PowerShell Gallery:

```powershell
Install-Module -Name SecretBackup
```

## Usage

### Backup Secret Store

To backup the PowerShell Secret Store, use the `Backup-SecretStore` cmdlet:

```powershell
Export-Secret -VaultName 'MyVault' -OutPath 'C:\Backups'
# 'C:\Backups\Backup_Vault.json' will contain all exported secrets
```

### Restore Secret Store

To restore the PowerShell Secret Store from a backup, use the `Import-SecretStore` cmdlet:

```powershell
Import-Secret -VaultName "MyOtherVault" -BackupFile 'C:\Backups\Backup_Vault.json' 
```

## Requirements

- PowerShell 7.0 or later
- SecretManagement module
- SecretStore module (if using the built-in PowerShell Secret Store)

## ToDo

- [ ] Support BYTE and Hastable type secrets
- [ ] Support metadata

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request with your changes. Ensure that your code adheres to the existing style and includes appropriate tests.

## License

This project is licensed under the MIT License. See the LICENSE file for details.

> [!WARNING]
> In early development stage, expect breaking changes

## Acknowledgments

- [SecretManagement module][SecretManagementGithub]
- [SecretStore module][SecretStoreGithub]

[SecretManagementGithub]: https://github.com/PowerShell/SecretManagement
[SecretStoreGithub]: https://github.com/PowerShell/SecretStore