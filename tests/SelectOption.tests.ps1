Describe "Menu Navigation" {
    BeforeAll {
        Import-Module "$PSScriptRoot/../PSPromptly.psm1" -Force
    }

    It "You must select the correct item." {
        InModuleScope -ModuleName 'PSPromptly' {
            Mock -CommandName Get-KeyInput -MockWith { return 13 }
            Mock -CommandName Render-Menu { }
        }

        $items  = @("A", "B", "C")
        $result = Select-Option -items $items -title "Test"
        $result | Should -Be "A"
    }

    It "should return null if the item list is empty" {        
        InModuleScope -ModuleName 'PSPromptly' {
            Mock -CommandName Render-Menu { }
            Mock -CommandName Write-Warning { }
        }

        $result = Select-Option -Items @() -Title "Empty Test"
        $result | Should -BeNullOrEmpty
    }
}