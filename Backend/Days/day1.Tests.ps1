BeforeAll {
    . $PSScriptRoot/day1.ps1
}

Describe "TextNumberReplacer" {
    It "Should correct values!" {
      TextNumberReplacer("two1nine") | Should -Be "t2wo1n9ine"
      TextNumberReplacer("eightwothree") | Should -Be "e8ight2wot3hree"
    }
  }

Describe "ConcatFirstAndLastDigit" {
    It "Should concat first and last digit!" {
      ConcatFirstAndLastDigit("1234") | Should -Be "14"
      ConcatFirstAndLastDigit("12345") | Should -Be "15"
    }
  }