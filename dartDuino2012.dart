#import("dart:io");
#source("SocketListener.dart");
#source("Command.dart");
#source("Questions.dart");
#source("Json.dart");
#source("HttpServerFactory.dart");
#source("Config.dart");
#source("QuizManager.dart");

SocketListener socket;
QuizManager quiz;
HttpServerFactory http;

bool questionStatus = false;

/**
 * 
 **/
void main() {
  socket = new SocketListener();
  http = new HttpServerFactory();
  quiz = new QuizManager();
  
  // simulate
  if (Config.ARDUINO_DISCONNECTED)  {
    receiveCommand("O0");
    receiveCommand("O1");
    receiveCommand("O2");
  }
}

void requestReceivedHandler(HttpRequest request, HttpResponse response) {
  if (Config.LOG)
      print("Request: ${request.method} ${request.uri}");

  String htmlResponse = quiz.showQuestion(questionStatus);
  
  response.headers.set(HttpHeaders.CONTENT_TYPE, "text/html; charset=UTF-8");
  response.outputStream.writeString(htmlResponse);
  response.outputStream.close();
}

void receiveCommand(String text) {  
  if (Command.isButtonSelected(text)) {
    String answer = text.substring(1,2);
    bool isCorrectAnswer = quiz.actualQuestion.isValidAnswer(answer);
    
    if (Config.LOG)
      print("isCorrectAnswer => ${isCorrectAnswer}");
    
    if (isCorrectAnswer)  {
      socket.write(Command.CLEAR);
      writeCommand(answer,"G");
      
      new Timer(2000, (var millisencods) {
        quiz.nextQuestion();
      });
    } else  {
      socket.write(Command.CLEAR);
      writeCommand(answer,"R");
    }
  }
}
void writeCommand(String button, String rgb) {
  socket.write(Command.CLEAR);
  socket.write(Command.TURN_ON(button,rgb));
}