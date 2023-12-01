$input = Get-Content -Raw "day1.txt"

function DefaultParser($inputText, $split = [System.Environment]::NewLine) {
    $stringSplitOptions = [System.StringSplitOptions]::RemoveEmptyEntries
    return $inputText.Split($split, $stringSplitOptions)
}

function TextNumberReplacer($inputText) {
    $inputText = $inputText.Replace("one", "o1ne")
    $inputText = $inputText.Replace("two", "t2wo")
    $inputText = $inputText.Replace("three", "t3hree")
    $inputText = $inputText.Replace("four", "f4our")
    $inputText = $inputText.Replace("five", "f5ive")
    $inputText = $inputText.Replace("six", "s6ix")
    $inputText = $inputText.Replace("seven", "s7even")
    $inputText = $inputText.Replace("eight", "e8ight")
    $inputText = $inputText.Replace("nine", "n9ine")
    $inputText = $inputText.Replace("zero", "z0ero")
    return $inputText
}

function NumberCollector($inputText) {
    $integers = $inputText.ToCharArray() | Where-Object { $_ -match "[0-9]" }
    return $integers
}

function ConcatFirstAndLastDigit($integers) {
    return $integers[0] + $integers[-1]
}

function AnswerProblem1($s) {
    $outerSum = 0
    foreach($line in $s) {
        $integers = NumberCollector($line)
        $outerSum += ConcatFirstAndLastDigit($integers)
    }
    return $outerSum
}

$s = DefaultParser($input)
Write-Output "Problem 1: "AnswerProblem1($s)

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
    $line = TextNumberReplacer($line)
    $integers = NumberCollector($line)
    $outerSum2 += ConcatFirstAndLastDigit($integers)
}

Write-Output "Problem 2: "$outerSum2
 
