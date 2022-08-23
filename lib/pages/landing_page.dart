import 'package:flutter/material.dart';
import './quiz_page.dart';

import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.green,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text('Lets Quiz',style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),),
            new Text('Tab to start !',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold)),
          ],
        ),
      ),
      );
  }
}
