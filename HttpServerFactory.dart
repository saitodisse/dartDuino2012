/**
 * HTTP server
 *
 **/
class HttpServerFactory {
  final HOST = "127.0.0.1";
  final PORT = 9000;
  HttpServer server;

  final LOG_REQUESTS = true;

  HttpServerFactory() {
    server = new HttpServer();
    
    server.addRequestHandler((HttpRequest request) => true, requestReceivedHandler);
    
    server.listen(HOST, PORT);
    
    print("Serving the current time on http://${HOST}:${PORT}."); 
  }
}
