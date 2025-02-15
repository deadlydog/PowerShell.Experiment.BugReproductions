# PowerShell Bug Reproductions

A small repo to reproduce PowerShell bugs in.

## ❓ Why this exists

When I encounter PowerShell bugs, I want to create minimal scripts that can reproduce the issue.
This makes it easy to share reproduction steps/examples with the PowerShell team, allowing them to confirm and troubleshoot the issue.

## 🐞 Bugs

Below is the list of bugs that I have found and can be reproduced:

- [Windows PowerShell 5.1 - Get-ChildItem ignores -Depth when used with -Include](src/5.1/Get-ChildItemIgnoresDepthParameter/ReadMe.md)
- [Windows PowerShell 5.1 - Start-Transcript inverts Write-Information behavior](src/5.1/Start-TranscriptInvertsWrite-Information/ReadMe.md)

## 📁 Repo organization

All code is located in the [src](/src/) folder.
The next folder indicates the version of PowerShell the bug should be reproducible in.
Lastly, each bug reproduction is put in it's own folder, along with a `ReadMe.md` file that describes it.

## ❤️ Donate to support this project

Buy me a Caramilk chocolate bar for helping improve the PowerShell language and docs 🙂

[![paypal](https://www.paypalobjects.com/en_US/i/btn/btn_donateCC_LG.gif)](https://www.paypal.me/deadlydogDan/5USD)
