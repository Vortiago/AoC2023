#using module "./RestServer.psm1"

Describe "RestServer" {
    It "Should return correct response!" {
        Start-Job -FilePath $PSScriptRoot/RestServer.TestsBackend.ps1
        $response = Invoke-RestMethod -Uri "http://localhost:8000/ping"  
        $response | Should -Be "Pong" 
    }
}
