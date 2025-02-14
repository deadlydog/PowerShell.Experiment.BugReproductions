[string] $powerShellVersion = $PSVersionTable.PSVersion.ToString()

$InformationPreference = "Continue"
Start-Transcript -Path "$PSScriptRoot\Result-PS-$powerShellVersion\InformationPreferenceContinue.txt"
Write-Output "About to write an Information message with InformationPreference set to '$InformationPreference'."
Write-Information -MessageData "Information message"
Stop-Transcript

$InformationPreference = "SilentlyContinue"
Start-Transcript -Path "$PSScriptRoot\Result-PS-$powerShellVersion\InformationPreferenceSilentlyContinue.txt"
Write-Output "About to write an Information message with InformationPreference set to '$InformationPreference'."
Write-Information -MessageData "Information message"
Stop-Transcript
