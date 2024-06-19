BeforeAll {
    Import-Module -Name .\PSPacker
    $data = Import-ProjectData
}

Describe 'General Module Control' {
    It 'Should import without errors' {
        ## PENDING
        { Import-Module -Name $data.OutputModuleDir -ErrorAction Stop } | Should -Not -Throw 
        Get-Module -Name $data.ProjectName | Should -Not -BeNullOrEmpty
    }
    It 'Should remove without errors' {
        { Remove-Module -Name $data.ProjectName -ErrorAction Stop } | Should -Not -Throw
        Get-Module -Name $data.ProjectName | Should -BeNullOrEmpty
    }
}