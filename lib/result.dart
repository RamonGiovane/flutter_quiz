import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget {
  final int _score;
  final void Function() _onRestartQuiz;

  ResultWidget(this._score, this._onRestartQuiz);

  String get finalMessage {
    
    if (_score == 3) return "All answers were correct. Impressive!";
    if (_score > 0) return "Correct answers: $_score";

    return "But answered everything wrong!";
  }

  Center _centralizedMessage(String text){
    
    return Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        _centralizedMessage("You did it!"),
        _centralizedMessage(finalMessage),
        FlatButton(
          child: Text(
            "Restart quiz",
            style: TextStyle(fontSize: 18),
          ),
          textColor: Colors.blue,
          onPressed: _onRestartQuiz,
        ),
      ],
    );
  }
}
