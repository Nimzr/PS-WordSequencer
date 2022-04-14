# what it do
This is part of a code challenge, at the moment this powershell function accepts a text file and turns the content into a series of 3-word-sequences, and then it ranks them based on occurrence. You have the option to decide how many results are returned to you. 
Bonus you get to see the whole file fly by in the terminal 1 word at a time.
![hackerman](./Assets/hackerman.jpg?raw=true "hackerman") 

## To do still:
* Allow for multiple text file imports (fairly easy)
* Add tests (not so easy)


## Requirements for it to work:
* This is a powershell function written in powershell 7. I believe it should work in other platforms but I wrote it and tested it on windows. GLHF
* Once you have the repo on your local machine you will need to open up a powershell termianl (Termianl, VSCode, or whatever) and then import the function, many ways to do that but you can try:
  * CD to the repo folder
  * Run :
   ```. .\PS-WordSequencer.ps1```
   this will run the script and add it globally as a function
  * Once you run that the function should be availabe to use

## Use:
* Invoke the function:

``` Get-WordSequence ```
* You will be asked for a the file path:

<code>Get-WordSequence  
Enter Path to File for import: </code>
* You can use one of the example files provided in samples:  
  
```Enter Path to File for import: F:\Repos\newrelic\PS-WordSequencer\samples\Hamlet.txt```

* Next you will be prompted for how many results you'd like to be returned to you (top x sequences) so enter a number here.

```Number of top sequences to return, For example: 20:```
* Enjoy the termianl showing you every word until the process is done

sample results:

![Results Table showing the highest count gruops](Assets/results.png?raw=true "result table")



  





