BeforeAll {
    Import-Module -Name .\PSPacker
    $data = Import-ProjectData
    $files = Get-ChildItem $data.OutputModuleDir
}

Describe 'Module and Manifest testing' {
    Context 'Test <_.Name>' -ForEach $files {
        It 'is file created' {
            $_ | Should -Exist
        }
        It 'is valid PowerShell Code' {
            $psFile = Get-Content -Path $_ -ErrorAction Stop
            $errors = $null
            $null = [System.Management.Automation.PSParser]::Tokenize($psFile, [ref]$errors)
            $errors.Count | Should -Be 0
        }
        It 'is code signed' -Skip:$(-not $data.CodeSign) {
            $status = (Get-AuthenticodeSignature -FilePath $_).Status
            if ($status -eq 'NotSigned') {
                Set-TestInconclusive -Message 'Not yet signed'
            }
            else {
                $status | Should -Be 'Valid'
            }
        }
    }
}