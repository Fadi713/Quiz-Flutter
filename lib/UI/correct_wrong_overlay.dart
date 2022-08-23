import 'dart:math' as math;


import 'package:flutter/material.dart';

class CorrectWrontOverlay extends StatefulWidget {
  final bool _isCorrect;
  final VoidCallback _onTap; 

  CorrectWrontOverlay(this._isCorrect,this._onTap);
  @override
  State createState() => new CorrectWrontOverlayState();
}

class CorrectWrontOverlayState extends State<CorrectWrontOverlay>
    with SingleTickerProviderStateMixin {
  late Animation<double> _iconAnimation;
  late AnimationController _iconAnimationController;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        duration: new Duration(seconds: 2), vsync: this);
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.elasticOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
 void dispose(){
   _iconAnimationController.dispose();
   super.dispose();
 }

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => widget._onTap(),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: new Transform.rotate(
                  angle: _iconAnimation.value * 2 * math.pi,
                  child: new Icon(
                    widget._isCorrect == true ? Icons.done : Icons.clear,
                    size:_iconAnimation.value* 80,
                  )),
            ),
            new Padding(padding: EdgeInsets.only(bottom: 20)),
            new Text(
              widget._isCorrect == true ? 'Correct!' : 'Wrong',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
