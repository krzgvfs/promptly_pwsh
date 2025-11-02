Describe "Menu Navigation" {
    It "You must select the correct item." {
        $items  = @("A", "B", "C")
        $result = Select-Option -items $items -title "Test"
        $result | Should -Be "A"
    }
}