class RestServer {
    # Initialise endpoints to empty list
    $EndPoints = @()
    $Listener
    
    # Constructor that initializes the listener to listen to localhost and port 8000.
    RestServer() {
        $this.Listener = New-Object System.Net.HttpListener
        $this.Listener.Prefixes.Add('http://localhost:8000/') 
    }

    # Run listener and wait for requests.
    [void]Run() {
        $this.Listener.Start()
        while ($this.Listener.IsListening) {
            $context = $this.Listener.GetContext()
            $this.ProcessRequest($context)
        }
    }

    # Stop the listener.
    [void]Stop() {
        $this.Listener.Stop()
    }

    # Process the request and send the response.
    [void]ProcessRequest($context) {
        $request = $context.Request
        $response = $context.Response
        if ($request.Url -match '/end$') { 
            exit
        } else {
            # $requestvars = ([String]$request.Url).split("/");  
            foreach ($endpoint in $this.EndPoints) {
                if ($request.Url -match $endpoint) {
                    $message = $this.EndPoints.ApiResponse($request) | ConvertTo-Json
                    $response.ContentEncoding = [System.Text.Encoding]::UTF8
                    $response.ContentType = 'application/json';
                    [byte[]]$buffer = [System.Text.Encoding]::UTF8.GetBytes($message)
                    $response.ContentLength64 = $buffer.length
                    $output = $response.OutputStream
                    $output.Write($buffer, 0, $buffer.length)
                    $output.Close()
                }
            }
        }
    }

    # Function to add endpoints to the list.
    [void]AddEndpoint($Endpoint) {
        $this.EndPoints += $Endpoint
    }
}
