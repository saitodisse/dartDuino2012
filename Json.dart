class Json {
  static String stringify(Question question, status) {
    return 
        '''
        {
          "question": "${question.value}",
          "answers": [
              {
                  "value": "${question.answers[0].value}",
                  "state": ${question.answers[0].state}
              },
              {
                  "value": "${question.answers[1].value}",
                  "state": ${question.answers[1].state}
              },
              {
                  "value": "${question.answers[2].value}",
                  "state": ${question.answers[2].state}
              }
          ],
          "status": true
        }
        ''';
    }
}
