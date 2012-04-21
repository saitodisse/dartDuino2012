/**
 * Program questions
 **/
class Questions {
  List<Question> questions;
  
  Questions() {
    questions = new List<Question>();
    
    List<Answer> answers = new List<Answer>(3);
    answers[0] = new Answer("Answer 1", false);
    answers[1] = new Answer("Answer 2", false);
    answers[2] = new Answer("Answer 3", false);
    
    questions.add(new Question("Question 1?", answers, "Answer 1"));
  }
}

class Question  {
  String value;
  List<Answer> answers;
  String correctAnswer;
  
  Question(String value, List<Answer> answers, String correctAnswer) {
    this.value = value;
    this.answers = answers;
    this.correctAnswer = correctAnswer;
  }
}

class Answer  {
  String value;
  bool state;
  
  Answer(String value, bool state) {
    this.value = value;
    this.state = state;
  }
}