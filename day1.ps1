$input = Get-Content -Raw "day1.txt"

function DefaultParser($inputText, $split = [System.Environment]::NewLine) {
    $stringSplitOptions = [System.StringSplitOptions]::RemoveEmptyEntries
    return $inputText.Split($split, $stringSplitOptions)
}

$s = DefaultParser($input)
$outerSum = 0
foreach($line in $s) {
    $integers = $line.ToCharArray() | Where-Object { $_ -match "[0-9]" }
    $outerSum += $integers[0] + $integers[-1]
}

Write-Output "Problem 1: "$outerSum

$input2 = "two1nine
eightwothree
abcone2threexyz
xtwone3four
4nineeightseven2
zoneight234
7pqrstsixteen"

$s = DefaultParser($input)
$outerSum2 = 0
foreach($line in $s) {
    $line = $line.Replace("one", "o1ne")
    $line = $line.Replace("two", "t2wo")
    $line = $line.Replace("three", "t3hree")
    $line = $line.Replace("four", "f4our")
    $line = $line.Replace("five", "f5ive")
    $line = $line.Replace("six", "s6ix")
    $line = $line.Replace("seven", "s7even")
    $line = $line.Replace("eight", "e8ight")
    $line = $line.Replace("nine", "n9ine")
    $line = $line.Replace("zero", "z0ero")
    $integers = $line.ToCharArray() | Where-Object { $_ -match "[0-9]" }
    $outerSum2 += $integers[0] + $integers[-1]
}

Write-Output "Problem 2: "$outerSum2