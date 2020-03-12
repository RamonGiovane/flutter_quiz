
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final String _question;
  
  final void Function() _onSelect;

  AnswerWidget(this._question, this._onSelect);

  @override
  Widget build(BuildContext context) {
    return 
       Container(
         width: double.infinity,
         child: RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: Text(_question),
                onPressed: _onSelect,
                 
              ),
       );
    
  }
}
