Questions questions;
int displayQuestion;

class QuizManager {
  QuizManager() {
    displayQuestion = 0;
    questions = new Questions();
  }
  
  String showQuestion(bool status) {
    Question question = questions.questions[displayQuestion];
    
    // write json
    String json = Json.stringify(question, status);
    
    return json;
  }
  
  Question get actualQuestion() {
    return questions.questions[displayQuestion];
  }
  
  void nextQuestion() {
    displayQuestion++;
  }
}

