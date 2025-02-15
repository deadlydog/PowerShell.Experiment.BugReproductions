Describe 'Using Get-ChildItem to get all directories named "Test"' {
	Context 'When there are 10 nested directories, each with a "Test" directory in them' {
		BeforeAll {
			# Create 10 nested directories.
			[string] $RootDirectoryPath = $TestDrive
			$Level1DirectoryPath = Join-Path -Path $RootDirectoryPath -ChildPath '1'
			$Level2DirectoryPath = Join-Path -Path $Level1DirectoryPath -ChildPath '2'
			$Level3DirectoryPath = Join-Path -Path $Level2DirectoryPath -ChildPath '3'
			$Level4DirectoryPath = Join-Path -Path $Level3DirectoryPath -ChildPath '4'
			$Level5DirectoryPath = Join-Path -Path $Level4DirectoryPath -ChildPath '5'
			$Level6DirectoryPath = Join-Path -Path $Level5DirectoryPath -ChildPath '6'
			$Level7DirectoryPath = Join-Path -Path $Level6DirectoryPath -ChildPath '7'
			$Level8DirectoryPath = Join-Path -Path $Level7DirectoryPath -ChildPath '8'
			$Level9DirectoryPath = Join-Path -Path $Level8DirectoryPath -ChildPath '9'
			$Level10DirectoryPath = Join-Path -Path $Level9DirectoryPath -ChildPath '10'

			# Create a "Test" directory in each nested directory.
			1..10 | ForEach-Object {
				[int] $number = $_
				$directoryPath = Get-Variable -Name "Level$($number)DirectoryPath" -ValueOnly
				$newTestDirectoryPath = Join-Path -Path $directoryPath -ChildPath 'Test'
				New-Item -Path $newTestDirectoryPath -ItemType Directory > $null
			}
		}

		It 'Should return all 10 directories when using -Include without -Depth' {
			$directories = Get-ChildItem -Path $RootDirectoryPath -Directory -Include 'Test' -Recurse
			$directories.Count | Should -Be 10
		}

		It 'Should return 5 directories when using -Include with -Depth 5' {
			$directories = Get-ChildItem -Path $RootDirectoryPath -Directory -Include 'Test' -Depth 5
			$directories.Count | Should -Be 5
		}

		It 'Should return all 10 directories when using -Filter without -Depth' {
			$directories = Get-ChildItem -Path $RootDirectoryPath -Directory -Filter 'Test' -Recurse
			$directories.Count | Should -Be 10
		}

		It 'Should return 5 directories when using -Filter with -Depth 5' {
			$directories = Get-ChildItem -Path $RootDirectoryPath -Directory -Filter 'Test' -Depth 5
			$directories.Count | Should -Be 5
		}
	}
}
