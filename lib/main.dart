import 'package:flutter/material.dart';
import 'package:flutter_quiz/result.dart';
import './question.dart';

main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  int _questionIndex = 0;

  int _score = 0;

  final _questions = const [
    {
      'text': "Is Dart strongly or weakly typed?",
      'answers': [
        {'text': "Strongly typed", 'correct': true},
        {'text': "Weakly typed", 'correct': false},
        {'text': "None. Medium typed", 'correct': false}
      ],
    },

    {
      'text': "Which company builted Flutter and Dart?",
      'answers': [
        {'text': 'Microsoft', 'correct': false},
        {'text': 'Google', 'correct': true},
        {'text': 'Zucc', 'correct': false}
      ]
    },

    {
      'text': "Which keyword is used to declare private members in Dart?",
      'answers': [
        {'text': 'Underscore', 'correct': true},
        {'text': 'private', 'correct': false},
        {'text': 'None. It is not possible.', 'correct': false}
      ]
    }
  ];

  
  bool get wasSelection {
    return _questionIndex < _questions.length;
  }

  @override
  Widget build(BuildContext context) {
   
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Quiz"),
        ),
        body: 
        
        wasSelection ?
            
            QuizWidget(
                questions: _questions,
                selectedQuestion: _questionIndex,
                onAnswer: _answer,
              )

            : ResultWidget(_score, _restartQuiz),

      ),
    );
  }

  void _answer(bool isCorrect) {
    
    if (wasSelection) setState(() => ++_questionIndex);
    
    _score += isCorrect ? 1 : 0;
    
    print("Answer given");
  }

  void _restartQuiz(){
    
    setState( () 
    {
      _questionIndex = 0;
      _score = 0;
    });
  }


}
