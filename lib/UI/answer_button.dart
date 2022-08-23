import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final bool _answer;
  final VoidCallback _onTap;

  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      //Tue Bitton
      child: new Material(
        color: _answer == true ? Colors.greenAccent : Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap(),
          child: new Center(
              child: new Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 5)),
            padding: EdgeInsets.all(20),
            child: new Text(
              _answer == true ? "True" : "False",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontSize: 40),
            ),
          )),
        ),
      ),
    );
  }
}
