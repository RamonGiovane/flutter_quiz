import 'package:flutter/material.dart';

import 'answer.dart';

class QuizWidget extends StatelessWidget {
  final void Function(bool) onAnswer;

  final List<Map<String, Object>> questions;

  final int selectedQuestion;

  QuizWidget(
      {@required this.questions,
      @required this.selectedQuestion,
      @required this.onAnswer});

  bool get wasSelection {
    return selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    var questionText = questions[selectedQuestion]['text'];

    List<Map<String, Object>> answers =
        wasSelection ? questions[selectedQuestion]['answers'] : null;

    return Column(
      children: <Widget>[
        QuestionWidget(questionText),
        ...answers.map((resp) {
          return AnswerWidget(
            resp['text'],
            () => onAnswer(resp['correct']),
          );
        }).toList(),
      ],
    );
  }
}

class QuestionWidget extends StatelessWidget {
  final String text;

  QuestionWidget(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
