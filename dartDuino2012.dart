#import("dart:io");
#source("SocketListener.dart");
#source("Commands.dart");
#source("Questions.dart");
#source("Json.dart");
#source("HttpServerFactory.dart");

SocketListener socket;

Questions questions;
int displayQuestion;


/**
 * 
 **/
void main() {
  questions = new Questions();
  socket = new SocketListener();
  displayQuestion = 0;
  
  HttpServerFactory http = new HttpServerFactory();
    
  showQuestion(true);
}

String showQuestion(bool status) {
  Question question = questions.questions[displayQuestion];
  
  // write json
  String json = Json.stringify(question, status);
  
  return json;
}

void requestReceivedHandler(HttpRequest request, HttpResponse response) {
  // print("Request: ${request.method} ${request.uri}");

  String htmlResponse = showQuestion(false);
  
  response.headers.set(HttpHeaders.CONTENT_TYPE, "text/html; charset=UTF-8");
  response.outputStream.writeString(htmlResponse);
  response.outputStream.close();
}

void receiveCommand(String command) {
  print(">> ${command}");
}

void writeCommand(String command) {
  socket.write(Commands.CLEAR);
  socket.write(Commands.TURN_ON("A","R"));
}