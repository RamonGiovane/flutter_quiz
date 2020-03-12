import 'package:flutter/material.dart';
import 'package:flutter_quiz/answer.dart';
import './question.dart';

main() => runApp(QuizApp());

class QuizApp extends StatefulWidget {

  @override
  _QuizAppState createState() {    
    return _QuizAppState();
  }

}

class _QuizAppState extends State<QuizApp>{
  var _questionIndex = 0;
  
  @override
  Widget build(BuildContext context){
  
    final List<Map<String, Object>> questions = 
    [
      { 'text': "Is Dart strongly or weakly typed?", 'answers': ["Strongly typed", "Weakly typed", "None. Medium typed"]},
      { 'text': "Which company builted Flutter and Dart?", 'answers': ['Microsoft', 'Google', 'Zucc']}, 
      { 'text': "Which keyword is used to declare private members in Dart", 'answers': ['Underscore', 'private', 'None. It is not possible.']}
    ];

    List<String> answers = questions[_questionIndex]['answers'];
   
    List<Widget> widgets = answers
      .map((t) => AnswerWidget(t, _answer))
      .toList();
    
    return MaterialApp(
      home: Scaffold(
        
        appBar: AppBar(
          title: Text("Flutter Quiz"),
        ),

        body: Column(
          children: <Widget>[
            
            QuestionWidget(questions[_questionIndex]['text']),
            
            ...answers.map((t) => AnswerWidget(t, _answer)).toList(),
            
            // AnswerWidget("Answer 1", _answer),

            // AnswerWidget("Answer 2", _answer),

            // AnswerWidget("Answer 3", _answer),

          ],
        )
        )
      );  
    
  }

  void _answer(){
    
    setState( () => _questionIndex++ );
    
    print("Answer given");
  }
}


