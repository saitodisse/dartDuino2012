Questions questions;
int displayQuestion;

class QuizManager {
  QuizManager() {
    displayQuestion = 0;
    questions = new Questions();
  }
  
  String showQuestion(bool status) {
    // write json
    String json = Json.stringify(actualQuestion, status);
    
    return json;
  }
  
  Question get actualQuestion() {
    if (Config.LOG)
      print("actualQuestion => ${questions.questions.length} < ${displayQuestion} ${questions.questions.length < displayQuestion}");    
    
    // if < return a blank question
    if (questions.questions.length <= displayQuestion)
      return null;
    
    return questions.questions[displayQuestion];
  }
  
  void nextQuestion() {
    displayQuestion++;
    
    if (Config.LOG)
      print("nextQuestion => ${questions.questions.length} < ${displayQuestion}");
  }
}

