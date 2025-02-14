# Windows PowerShell 5.1 - Start-Transcript inverts Write-Information behavior

## Problem

In Windows PowerShell 5.1, there is a bug in `Start-Transcript` that causes `Write-Information` to:

1. NOT write to the transcript file when the InformationPreference is Continue.
2. Write to the transcript file when the InformationPreference is set to SilentlyContinue.
This is the opposite of what is expected.

## Reproduce

To reproduce the bug, run the [Test.ps1](Test.ps1) script in Windows PowerShell 5.1.
The script will create a Result folder with two transcript files:

1. InformationPreferenceContinue.txt - This file will NOT contain the Write-Information message.
2. InformationPreferenceSilentlyContinue.txt - This file will contain the Write-Information message.

The results of running the [Test.ps1](Test.ps1) script in Windows PowerShell 5.1 and PowerShell 7.5 are included in the Result folder for convenience and easy comparison.

## Consequence

This bug means that in PowerShell 5.1 you cannot have Information messages go to both the console AND the transcript file.
You have to choose between having them go to the console OR the transcript file.

## Fixed

If you run the [Test.ps1](Test.ps1) script in PowerShell 6+, you will see that the bug is fixed and both the console and the transcript file will contain the same Information messages, as expected.
