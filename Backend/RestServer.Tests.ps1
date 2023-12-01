import-module $PSScriptRoot"/RestServer.psm1"

Describe "RestServer" {
    It "Should return correct response!" {
        Start-Job -ScriptBlock {
            class Ping {
                [string]ApiResponse($request) {
                    return "Pong"
                }
            }

            $server = [RestServer]::new()
            $server.AddEndpoint([Ping]::new())
            $server.Run()
        }

        $response = Invoke-RestMethod -Uri "http://localhost:8000/ping"  
        $response | Should -Be "Pong" 
    }
}

AfterAll {
    Remove-Module RestServer
}