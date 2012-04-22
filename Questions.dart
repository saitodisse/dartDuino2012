/**
 *
 * Program Questions
 *
 **/
class Questions {
  List<Question> questions;
  
  Questions() {
    questions = new List<Question>();
    
    addQuestion("What is the best version control?",
      "Subversion",
      "Mercurial",
      "Git",
      2);

    addQuestion("What is the best methodology to develop software?",
      "Waterfall development",
      "Agile software development",
      "Spiral development",
      1);

    addQuestion("What are the numeric types of DART language?",
      "int, float, decimal",
      "int, float, double",
      "int, double",
      2);
  }
  
  void addQuestion(question, answerA, answerB, answerC, indiceCorrectAnswer){
    List<Answer> answers = new List<Answer>(3);
    answers[0] = new Answer(answerA, Answer.NEUTRAL);
    answers[1] = new Answer(answerB, Answer.NEUTRAL);
    answers[2] = new Answer(answerC, Answer.NEUTRAL);
    
    questions.add(new Question(question, answers, answers[indiceCorrectAnswer].value));
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
        answers[p].state = Answer.CORRECT;
        
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
  String state; // N => neutral, C => correct and I => incorrect
  
  static final String NEUTRAL = "N";
  static final String CORRECT = "C";
  static final String INCORRECT = "I";
  
  Answer(String value, String state) {
    this.value = value;
    this.state = state;
  }
}