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
    // if < return a blank question
    if (questions.questions.length < displayQuestion)
      return new Question(null, null, null);
    
    return questions.questions[displayQuestion];
  }
  
  void nextQuestion() {
    displayQuestion++;
  }
}

