import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  List<Icon> valid = [];
  List<String> questions = [
    'I\'m a 2nd year student who likes watching K-drama',
    'Most of my time is wasted on procrastination',
    'Baking is my favourite in cooking',
    'I\'m 26 years old',
    'Colleges will be opening this month',
    'Sydney is the capital of Australia',
    'Flutter is fun and easy!',
    'Scaffold helps design the interface',
  ];
  List<bool> answers = [
    true,
    true,
    true,
    false,
    false,
    false,
    true,
    true,
  ];
  int questionNumber = 0;

  void _showChange(bool validity) {
    setState(() {
      var checker = answers[questionNumber];
      int stackNumber = questions.length;
      if (questionNumber + 1 <= questions.length) {
        if (checker == validity) {
          print('Correct');
          debugPrint(
              "Question number : $questionNumber and question stack $stackNumber");
          valid.add(Icon(Icons.check, color: Colors.green));
          //snackbar
          Scaffold.of(context).showSnackBar(new SnackBar(
            content: new Text(
              "That's correct",
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ));
        } else {
          print('Ooops');
          debugPrint(
              "Question number : $questionNumber and question stack $stackNumber ");
          valid.add(Icon(Icons.close, color: Colors.red));
          Scaffold.of(context).showSnackBar(new SnackBar(
              backgroundColor: Colors.redAccent,
              content: new Text(
                "Oopsie daisies!",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              duration: Duration(milliseconds: 80)));
        }
        questionNumber++;
        debugPrint("Question number after $questionNumber");

        if (questionNumber == questions.length) _onBasicAlertPressed(context);
      }
    });
  }

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //stack
            Stack(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 150, bottom: 160),
                  child: Container(
                      height: 150,
                      width: double.infinity,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(20),
                        ),
                        elevation: 20,
                        color: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                        ),
                      )),
                ),
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 165, left: 20, right: 20),
                  child: Text(questions[questionNumber],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ),
            ]),
            SizedBox(
              height: 50,
              child: RaisedButton(
                  splashColor: Colors.black,
                  onPressed: () {
                    _showChange(true);
                  },
                  color: Colors.green,
                  child: Text("True",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ))),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              child: RaisedButton(
                  splashColor: Colors.black,
                  onPressed: () {
                    _showChange(false);
                  },
                  color: Colors.red,
                  child: Text("False",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ))),
            ),
            Row(
              children: valid,
            )
          ],
        ),
      ),
    );
  }
}

_onBasicAlertPressed(context) {
  Alert(
    context: context,
    title: "ALERT",
    desc: "That is all folks!",
  ).show();
}
