$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'
. "$here\$sut"

Describe "Main" {
    Context "Init with no args" {
        Mock Main {} -Verifiable

        $result = Main

        It "Creates a new $Profile.CurrentUserCurrentHost" {
            Assert-VerifiableMocks
        }
    }

    Context "Init with 1 arg" {
        $1arg = "AllUsersAllHosts"
        Mock Main {} -Verifiable -ParameterFilter {$Types -eq $1arg}

        $result = Main

        It "Creates a new $Profile.AllUsersAllHosts" {
            Assert-VerifiableMocks
        }
    }
}
