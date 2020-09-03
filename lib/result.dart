import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int score;
  final Function resetHandler;

  Result(this.score, this.resetHandler);

  String get resultText {
    String txt;
    if (score > 40) {
      txt = 'You are awesome';
    } else if (score > 30) {
      txt = 'Impressive';
    } else if (score > 20) {
      txt = 'Questions Here ??';
    } else {
      txt = 'You are weird man !!';
    }
    return txt;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Text(
        resultText,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      FlatButton(
          onPressed: resetHandler, color: Colors.blue, child: Text('reset'))
    ]));
  }
}
