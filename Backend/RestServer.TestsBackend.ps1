using module "./RestServer.psm1"

class Ping {
    [string]ApiResponse($request) {
        return "Pong"
    }
}

$server = [RestServer]::new()
$server.AddEndpoint([Ping]::new())
$server.Run()