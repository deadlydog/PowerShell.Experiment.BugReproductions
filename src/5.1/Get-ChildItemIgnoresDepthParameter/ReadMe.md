# Windows PowerShell 5.1 - Get-ChildItem ignores -Depth when used with -Include

## Problem

In Windows PowerShell 5.1, there is a bug in `Get-ChildItem` where if you use both the `-Include` parameter and the `-Depth` parameter, then the `-Depth` parameter is ignored and it recurses through all directories.

## Reproduce

To reproduce the bug, run the [Test.ps1](Test.ps1) script with Pester in Windows PowerShell 5.1.
e.g.

```powershell
Invoke-Pester -Script .\Test.ps1
```

You will see that the test case that uses `-Include` with `-Depth` fails, as it ignores the Depth parameter and recurses through all directories.

You can then run the [Test.ps1](Test.ps1) script with Pester in PowerShell 7.5 to see that the bug is fixed and all tests pass.

## Work around

If possible, use the `-Filter` parameter instead of the `-Include` parameter in Windows PowerShell 5.1.

## Fixed

As mentioned, this bug is not present in PowerShell 7.5.
I assume it was fixed in PowerShell 6, but I have not confirmed that.
