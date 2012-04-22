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
  response.headers.set("Access-Control-Allow-Origin", "http://127.0.0.1:3030");
  response.headers.set("Access-Control-Allow-Credentials", "true");
  
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
      socket.write(Command.TURN_ON(answer,"G"));
      
      if (!Config.ARDUINO_BELL_OFF)
        socket.write(Command.TURN_BELL_ON(1));
    } else  {
      socket.write(Command.CLEAR);
      socket.write(Command.TURN_ON(answer,"R"));
      socket.write(Command.TURN_ON(quiz.actualQuestion.correctAnswerPostion,"G"));
      
      if (!Config.ARDUINO_BELL_OFF)
        socket.write(Command.TURN_BELL_ON(3));
    }
    
    new Timer(2000, (var millisencods) {
      socket.write(Command.CLEAR);
      quiz.nextQuestion();
    });    
  }
  
  if (quiz.finishQuestions()) {
    new Timer(12000, (var millisencods) {
      socket.write(Command.CLEAR);
      quiz.startQuestion();
    }); 
  }
}
