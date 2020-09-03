import 'package:flutter/material.dart';

import 'question.dart';
import 'answer.dart';
import 'result.dart';
import 'quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite colour?',
      'answers': [
        {'text': 'black', 'score': 40},
        {'text': 'red', 'score': 30},
        {'text': 'green', 'score': 20},
        {'text': 'white', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'lion', 'score': 40},
        {'text': 'pig', 'score': 30},
        {'text': 'rabbit', 'score': 20},
        {'text': 'deer', 'score': 10},
      ]
    },
    {
      'questionText': 'What\'s your favorite Vehicle?',
      'answers': [
        {'text': 'benz', 'score': 40},
        {'text': 'bmw', 'score': 30},
        {'text': 'ford', 'score': 20},
        {'text': 'toyota', 'score': 10},
      ]
    }
  ];

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
      _totalScore += score;
    });
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('My First App')),
      body: _questionIndex < _questions.length
          ? Quiz(
              questionIndex: _questionIndex,
              questions: _questions,
              answerQuestion: _answerQuestion,
            )
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
