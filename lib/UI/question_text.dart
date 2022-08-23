import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

class QuestionText extends StatefulWidget {
  final String _question;
  final int _questionNumber;

  QuestionText(this._question, this._questionNumber);

  @override
  State createState() => new QuestionTextState();
}

//(SingleTickerProviderStateMixin) we need this for animation!!
class QuestionTextState extends State<QuestionText>
    with SingleTickerProviderStateMixin {
// class QuestionTextState extends State<QuestionText> {
  late Animation<double> _fontSizeAnimation;
  late AnimationController _fontSizeAnimationController;

  @override
  void initState() {
    super.initState();
    _fontSizeAnimationController = new AnimationController(
        duration: new Duration(milliseconds: 800), vsync: this);
    _fontSizeAnimation = new CurvedAnimation(
        parent: _fontSizeAnimationController, curve: Curves.bounceOut);
    _fontSizeAnimation.addListener(() => this.setState(() {}));
    _fontSizeAnimationController.forward();
  }

  //to restart the animation of the Question Text
  @override
  void didUpdateWidget(QuestionText oldWidget){
    super.didUpdateWidget(oldWidget);
    if(oldWidget._question !=widget._question){
      _fontSizeAnimationController.reset();
      _fontSizeAnimationController.forward();
    }
  }
  @override
  void dispose() {
    _fontSizeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        
        width: double.infinity,
        height: 60,
        child: Material(
          
            color: Colors.white,
            child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Center(
                    child: Text(
                  'Statmenan ' +
                      widget._questionNumber.toString() +
                      ' ' +
                      widget._question,
                  style: TextStyle(fontSize: _fontSizeAnimation.value * 15),
                  //   child: AnimatedTextKit(
                  //     animatedTexts: [
                  //   FadeAnimatedText(
                  //       widget._questionNumber.toString() + " " + widget._question,
                  //       duration: Duration(seconds: 1),
                  //       textStyle: TextStyle(fontSize: 20,),
                  //       textAlign : TextAlign.center,
                  //       ),
                  //     ],
                  //     repeatForever: true,
                  //     isRepeatingAnimation: true,
                  //   ),
                  // )),
                )))));
  }
}
