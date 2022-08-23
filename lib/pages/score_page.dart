//import 'dart:html';

import 'package:flutter/material.dart';
import './landing_page.dart';

class ScorePage extends StatelessWidget {
  final int totalQuestion;
  final int score;

  ScorePage(this.score, this.totalQuestion);
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.blueAccent,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Text(
            "Your Score : ",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50),
          ),
          new Text(score.toString() + '/' + totalQuestion.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 50)),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'Restart',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 22),
            child: new IconButton(
                onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                    new MaterialPageRoute(
                        builder: (BuildContext context) => new LandingPage()),
                    (Route route) => route == null),
                icon: new Icon(
                  Icons.restart_alt,
                  color: Colors.white,
                  size: 50,
                )),
          )
        ],
      ),
    );
  }
}
