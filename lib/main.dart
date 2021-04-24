import 'package:flutter/material.dart';
import 'QuizBrain.dart';

void main() => runApp(Quizzler());
QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper = [];

//  List<String> questions=[
// 'You can lead a cow down stairs but not up stairs.',
// 'Approximately one quarter of human bones are in the feet.',
//'A slug\'s blood is green.',
//  ];
//
//  List<bool> answers=[false,true,true];
//
//  Question q1= Question(q:'You can lead a cow down stairs but not up stairs.',a:false);

//  List<Question> questionBank =[
//    Question(q:'You can lead a cow down stairs but not up stairs.',a:false),
//    Question(q:'Approximately one quarter of human bones are in the feet.',a:true),
//    Question(q:'A slug\'s blood is green.',a:false),
//  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                bool correctanswer = quizBrain.getCorrectAnswer();
                if (correctanswer)
                  print("correct answer");
                else
                  print("wrong answer");
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                bool correctanswer = quizBrain.getCorrectAnswer();
                if (correctanswer)
                  print("correct answer");
                else
                  print("wrong answer");
                setState(() {
                  quizBrain.nextQuestion();
                });
              },
            ),
          ),
        ),

        //TODO: Add a Row here as your score keeper
        Row(
          children: scorekeeper,
        ),
      ],
    );
  }
}
