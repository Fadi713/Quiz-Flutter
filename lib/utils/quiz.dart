import '../utils/questions.dart';

import 'questions.dart'; 

class Quiz{
  List<Question> _questions;
  int _currentQuestionIndex = -1;
  int _score = 0; 

  Quiz(this._questions){
    _questions.shuffle();
  }
  //Getters
  int get score => _score;
  List<Question> get questions=>_questions;
  int get length=>_questions.length;
  int get questionNumber => _currentQuestionIndex + 1;


  //I have made Question class nullable by adding ? which is not written in the course
  Question? get nextQuestion {
    _currentQuestionIndex++;
    if(_currentQuestionIndex >= length)return null;
    return _questions[_currentQuestionIndex];
  }
  void answer(bool isCorrect){
    if (isCorrect) _score++;
  }

}