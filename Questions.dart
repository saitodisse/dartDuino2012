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
    answers[0] = new Answer("Subversion", false);
    answers[1] = new Answer("Mercurial", false);
    answers[2] = new Answer("Git", false);
    
    questions.add(new Question("What is the best version control?", answers, answers[2].value"));
    
    List<Answer> answers2 = new List<Answer>(3);
    answers2[0] = new Answer("Waterfall development", false);
    answers2[1] = new Answer("Agile software development ", false);
    answers2[2] = new Answer("Spiral development", false);
    
    questions.add(new Question("What is the best methodology to develop software?", answers2, answers[1].value));
    
    List<Answer> answers3 = new List<Answer>(3);
    answers3[0] = new Answer("int, float, decimal", false);
    answers3[1] = new Answer("int, float, double", false);
    answers3[2] = new Answer("int, double", false);
    
    questions.add(new Question("What are the numeric types of DART language?", answers3, answers3[2].value));    
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