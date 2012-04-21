/**
 * Socket listener
 **/
class SocketListener {
  String socket_ip = "192.168.0.104";
  int socket_port = 10002;
  
  Socket socket;
  SocketInputStream inputStream;
  OutputStream outputStream;
  StringBuffer stringBuffer;
  
  SocketListener()  {
    socket = new Socket(socket_ip, socket_port);

    socket.onError = (e) => print("Error: $e");
    
    socket.onConnect = () {
      print('Socket connect .... ${socket.available()}');
      
      inputStream = new SocketInputStream(socket);
      outputStream = socket.outputStream;
    };
    
    socket.onData = () {
      List<int> response = inputStream.read(socket.available());
      String command = new String.fromCharCodes(response);
      
      runCommand(command);
    }; 
  }
  
  /**
   * Socket write
   **/
  void write(String command)  {
    outputStream.writeString(command);
  }
}
