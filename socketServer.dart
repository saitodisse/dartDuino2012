#import("dart:io");
#source("SocketListener.dart");
#source("Commands.dart");

SocketListener socket;

/**
 * 
 **/
void main() {
    socket = new SocketListener();
    
}


void runCommand(String command) {
  print(">> ${command}");
  
  socket.write(Commands.CLEAR);
  socket.write(Commands.TURN_ON("A","R"));
}