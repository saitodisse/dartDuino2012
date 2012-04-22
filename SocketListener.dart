/**
 * Socket listener
 **/
class SocketListener {
  Socket socket;
  SocketInputStream inputStream;
  OutputStream outputStream;
  StringBuffer stringBuffer;
  
  SocketListener()  {
    socket = new Socket(Config.SOCKET_IP, Config.SOCKET_PORT);

    socket.onError = (e) => print("Error: $e");
    
    socket.onConnect = () {
      print('Socket connect .... ${socket.available()}');
      
      inputStream = new SocketInputStream(socket);
      outputStream = socket.outputStream;
      
      this.write(Command.CLEAR);
    };
    
    socket.onData = () {
      List<int> response = inputStream.read(socket.available());
      String command = new String.fromCharCodes(response);
      
      receiveCommand(command);
    }; 
    
    socket.onClosed  = () {
      socket.close();
    };    
  }
  
  /**
   * Socket write
   **/
  void write(String command)  {
    if (Config.LOG)
      print("socketCommand => ${command}");
    
    if (outputStream != null)
      outputStream.writeString(command);
  }
}
