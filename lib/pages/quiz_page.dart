import 'package:flutter/material.dart';
import '../utils/questions.dart';
import '../utils/quiz.dart';
import '../UI/answer_button.dart';
import '../UI/question_text.dart';
import '../UI/correct_wrong_overlay.dart';
import '../pages/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State createState() => new QuizPageState();
}

class QuizPageState extends State<QuizPage> {
  late Question currentQuestion;
  Quiz quiz = new Quiz([
    new Question("Elon musk is Human", false),
    new Question('Pizza is Healthy', false),
    new Question('flutter is Awsome', true),
    new Question('Earth is round', true)
  ]);
  late String questionText;
  late int questionNumber;
  late bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion!;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (currentQuestion.answer == answer);
    quiz.answer(isCorrect);
    this.setState(() {
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Column(
            //this is our main page
            children: <Widget>[
              new AnswerButton(true, () => handleAnswer(true)),
              new QuestionText(questionText, questionNumber),
              
              new AnswerButton(false, () => handleAnswer(false)),
            ]),
        overlayShouldBeVisible == true
            ? CorrectWrontOverlay(isCorrect, (() {
              if(quiz.length==questionNumber){
                Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (BuildContext context) => new ScorePage(quiz.score, quiz.length)),(Route route )=> route==null);
                return;
              }
                currentQuestion = quiz.nextQuestion!;
                this.setState(() {
                  overlayShouldBeVisible = false;
                  questionText = currentQuestion.question;
                  questionNumber = quiz.questionNumber;
                });
              }))
            : new Container()
      ],
    );
  }
}
