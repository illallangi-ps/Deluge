if ($null -eq (Get-Module PSCompletion))
{
	Write-Debug "Import-Module PSCompletion -Global"
	Import-Module PSCompletion -Global -ErrorAction SilentlyContinue
	if ($null -eq (Get-Module PSCompletion))
	{
		Write-Warning "PSCompletion module not found; tab completion will be unavailable."
	}
}

if ($null -ne (Get-Module PSCompletion))
{
	Register-ParameterCompleter Get-DelugeLabel Name {
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
		Get-DelugeLabel -Name "$wordToComplete*" | Sort-Object { $_.Count } |%{ New-CompletionResult "$($_.Name)" }
	}
	
	Register-ParameterCompleter Get-DelugeState Name {
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
		Get-DelugeState -Name "$wordToComplete*" | Sort-Object { $_.Count } |%{ New-CompletionResult "$($_.Name)" }
	}
	
	Register-ParameterCompleter Get-DelugeTrackerHost Name {
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
		Get-DelugeTracker -Name "$wordToComplete*" | Sort-Object { $_.Count } |%{ New-CompletionResult "$($_.Name)" }
	}
	
	Register-ParameterCompleter Get-DelugeTorrent Label {
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
		Get-DelugeLabel -Name "$wordToComplete*" | Sort-Object { $_.Count } |%{ New-CompletionResult "$($_.Name)" }
	}
	
	Register-ParameterCompleter Get-DelugeTorrent Name {
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
		Get-DelugeTorrent -Name "$wordToComplete*" | Sort-Object { $_.Count } |%{ New-CompletionResult "$($_.Name)" }
	}
	
	Register-ParameterCompleter Get-DelugeTorrent State {
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
		Get-DelugeState -Name "$wordToComplete*" | Sort-Object { $_.Count } |%{ New-CompletionResult "$($_.Name)" }
	}

	Register-ParameterCompleter Get-DelugeTorrent TrackerHost {
		param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameter)
		Get-DelugeTracker -Name "$wordToComplete*" | Sort-Object { $_.Count } |%{ New-CompletionResult "$($_.Name)" }
	}
}