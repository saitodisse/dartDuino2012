/**
 * HTTP server
 *
 **/
class HttpServerFactory {
  HttpServer server;

  HttpServerFactory() {
    server = new HttpServer();
    
    server.addRequestHandler((HttpRequest request) => true, requestReceivedHandler);
    
    server.listen(Config.HTTP_HOST, Config.HTTP_PORT);
    
    if (Config.LOG)
          print("Serving the current time on http://${Config.HTTP_HOST}:${Config.HTTP_PORT}."); 
  }
}
