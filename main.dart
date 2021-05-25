import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz_page.dart';

var _color = Colors.white;
int counter = 0;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.purple,
            title: Text('QUIZZING',
                style: TextStyle(
                  letterSpacing: 3,
                  fontSize: 30,
                )),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.favorite,
                    color: _color,
                  ),
                  onPressed: () {
                    counter++;
                    setState(() {
                      if (counter % 2 == 0)
                        _color = Colors.redAccent;
                      else
                        _color = Colors.white;
                    });
                  }),
            ],
          ),
          body: HomePage(),
        ));
  }
}
