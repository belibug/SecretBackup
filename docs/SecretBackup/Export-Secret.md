---
document type: cmdlet
external help file: SecretBackup-Help.xml
HelpUri: ''
Locale: en-US
Module Name: SecretBackup
ms.date: 03/23/2026
PlatyPS schema version: 2024-05-01
title: Export-Secret
---

# Export-Secret

## SYNOPSIS

Exports secrets from a specified vault to a JSON file.

## SYNTAX

### __AllParameterSets

```
Export-Secret [-VaultName] <string> [[-OutPath] <string>] [<CommonParameters>]
```

## ALIASES

This cmdlet has the following aliases,
  {{Insert list of aliases}}

## DESCRIPTION

This function exports secrets from a specified vault to a JSON file.
It retrieves secret information from the vault and converts it to a JSON format for export.

## EXAMPLES

### EXAMPLE 1: Exports secrets from the 'MyVault' vault and saves the JSON file to the 'C:\Backups' directory.

Export-Secret -VaultName 'MyVault' -OutPath 'C:\Backups'

### EXAMPLE 2: Exports secrets from the 'MyVault' vault and saves the JSON file to the current location.

Export-Secret -VaultName 'MyVault'

## PARAMETERS

### -OutPath

Specifies the output path where the JSON file will be saved.
If not provided, the current location will be used as the default output path.

```yaml
Type: System.String
DefaultValue: (Get-Location).Path
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 1
  IsRequired: false
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### -VaultName

Specifies the name of the vault from which to export secrets.
This parameter is mandatory.

```yaml
Type: System.String
DefaultValue: ''
SupportsWildcards: false
Aliases: []
ParameterSets:
- Name: (All)
  Position: 0
  IsRequired: true
  ValueFromPipeline: false
  ValueFromPipelineByPropertyName: false
  ValueFromRemainingArguments: false
DontShow: false
AcceptedValues: []
HelpMessage: ''
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable,
-InformationAction, -InformationVariable, -OutBuffer, -OutVariable, -PipelineVariable,
-ProgressAction, -Verbose, -WarningAction, and -WarningVariable. For more information, see
[about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

Exports secretes in plain text.
Make sure you protect the exported data.


## RELATED LINKS

{{ Fill in the related links here }}

