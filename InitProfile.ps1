<# 
InitProfile.ps1

Creates a new PowerShell profile if one doesn't exist
#>
[CmdletBinding()]

param (
    [string[]]$Types = "CurrentUserCurrentHost"
)

function Main() {
    param (
        [Parameter(Mandatory=$true)]
            [string[]]$Types   
    )

    ForEach ($Type in $Types) {
        if (!(Test-Path $($Profile.$Type))) {
            New-Item -ItemType File -Path $($Profile.$Type)
        }
    }
}

Main -Types $Types