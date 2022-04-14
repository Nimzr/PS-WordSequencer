
function Get-WordSequence {
    [CmdletBinding()]
    param (
        [String]$FilePath,
        [Int]$NumberOfResults
    )

    ##left over option, can be easily used in the RawArray Split line
    $option = [System.StringSplitOptions]::RemoveEmptyEntries
    $separator = " "
    ##Regex for removing all special characters from the text
    $Patternregex = '[^a-zA-Z0-9]'
    ##File Path is the minimum requirement, promps the user and stores the result as a variable to be used later
    $FilePath =  Read-Host "Enter Path to File for import"
    ##Option for how many top sequences to return, needs to be an integar
    $NumberOfResults = Read-Host "Number of top sequences to return, For example: 20"

    ##File Import and Cleanup:
    ##1. the contents of the file are imported
    ##2. The text is cleaned up by removing all special characters and new lines and replaces them with a space.
    ##3. Two sets of split are performed to create an array of the cleaned up text and then remove empty entries
    $TextFileContents = Get-Content -Path $FilePath -Raw
    $CleanedupText = $TextFileContents -replace $Patternregex, " "
    $RawArray = $CleanedupText.Split(" ")
    $RawArray = $RawArray.Split('',[System.StringSplitOptions]::RemoveEmptyEntries)
    
    ##Empty Array is initialized to be used later in the loop
    $ThreeWordSequences = @()
    
    ##Pretty obvious, probably not necessary but super cool seeing all the words fly by. 
    Write-output "Raw count of the array is: $($RawArray.Count)"
    
    ##Main loop, all it is doing is for every word in the array, it is grabbing that word and the next 2 words and
    ##creating a new entry in the Sequence Array and adding those 3 words in there and a new string.
    $CurrentPosition = 0
    foreach ($Word in $RawArray) {
        
        Write-Output "The Current Word is : $Word"
        $ThreeWordSequences += "$Word $($RawArray[$CurrentPosition + 1]) $($RawArray[$CurrentPosition + 2])"
        $CurrentPosition++
    
    }

    ##using powershell to simply group all those entries which gives us the count and then sorting
    ##the last bit is using the number that the user provided to decide how many results to show. 
    $ThreeWordSequences | group | Sort-Object -Property Count -Descending | Select-Object -First $NumberOfResults

}