import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quest.dart';

void main() => runApp(Quizzler());

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
  List<Widget> scorekeeper= [];

  List<Question>questionbank=[
    Question(q:'You can lead a cow down stairs but not up stairs.',a:false),
    Question(q:'Approximately one quarter of human bones are in the feet.',a: true),
    Question(q: 'A slug\'s blood is green.',a:true),
    Question(q:'The total surface area of two human lungs is approximately 70 square metres.',a:
  true),
  ];


  int questionno=0;

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
                questionbank[questionno].questiontext,
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
                bool correctans=questionbank[questionno].questionans;

                if(correctans==true)
                  {
                   scorekeeper.add(Icon(Icons.check,color: Colors.green,));
                  }
                else{
                  scorekeeper.add(Icon(Icons.close,color: Colors.red,));
                }
                setState(() {
                  if(questionno==3)
                  {
                    Alert(context: context, title: "FINISHED", desc: "WANT TO QUIT?").show();
                    questionno=0;
                    scorekeeper=[];

                  }
                  else
                    {questionno++;}
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                bool correctans=questionbank[questionno].questionans;
                if(correctans==false)
                {
                  scorekeeper.add(Icon(Icons.check,color: Colors.green,));
                }
                else{
                  scorekeeper.add(Icon(Icons.close,color: Colors.red,));
                }
                setState(() {
                  if(questionno==3)
                  {
                    Alert(context: context, title: "FINISHED", desc: "WANT TO QUIT?").show();
                    questionno=0;
                    scorekeeper=[];
                  }
                  else
                  {questionno++;}
                });
              },
            ),
          ),
        ),
        Row(
         children: scorekeeper
        )
      ],
    );
  }
}


