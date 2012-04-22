/**
 *
 * Program Questions
 *
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
    
    List<Answer> answers2 = new List<Answer>(3);
    answers2[0] = new Answer("Answer 1", false);
    answers2[1] = new Answer("Answer 2", false);
    answers2[2] = new Answer("Answer 3", false);
    
    questions.add(new Question("Question 2?", answers2, "Answer 2"));
    
    List<Answer> answers3 = new List<Answer>(3);
    answers3[0] = new Answer("Answer 1", false);
    answers3[1] = new Answer("Answer 2", false);
    answers3[2] = new Answer("Answer 3", false);
    
    questions.add(new Question("Question 3?", answers3, "Answer 3"));    
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
  
  bool isValidAnswer(String button)  {
    if (Config.LOG)
          print("button => ${button}");
    
    for (int p = 0; p < answers.length; p++)  {
      if (Config.LOG)
        print("${answers[p].value} == ${correctAnswer}");
      
      if (answers[p].value == correctAnswer)  {
        if (Config.LOG)
          print("button => ${p} == ${button}");
        
        bool isCorrect = ("${p}" == button);
        answers[p].state = isCorrect;
        
        return isCorrect;
      }
    }
  }
  
  String get correctAnswerPostion() {
    for (int p = 0; p < answers.length; p++)  {
      if (answers[p].value == correctAnswer)  {
        if (Config.LOG)
          print("correctAnswerPostion => ${p}");
        
        return "${p}";
      }
    }
  }
}

class Answer  {
  String value;
  bool state; // N => neutral, C => correct and I => incorrect
  
  Answer(String value, bool state) {
    this.value = value;
    this.state = state;
  }
}