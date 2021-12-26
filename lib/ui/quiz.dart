import 'package:flutter/material.dart';

import '../model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List questionBank = [
    Question("Nigeria gained Independence in year 1960", true),
    Question("Marrakesh is the capital of Morocco.", false),
    Question(
        "Waterloo has the greatest number of tube platforms in London.", true),
    Question("M&M stands for Mickey and Moordale.", false),
    Question("The unicorn is the national animal of Scotland.", true),
    Question(
        "Idina Menzel sings the phrase, 'Let it go' 10 times in the song Let It Go",
        false),
    Question(
        "'A' is the most common letter used in the English language.", false),
    Question("A lion's roar can be heard up to eight kilometers away.", true),
    Question("Monaco is the smallest country in the world.", false),
    Question("There are five main blood groups.", false),
    Question("Goldfish only have a memory of three seconds.", false),
    Question("A group of swans is known as a 'bevy'.", true),
    Question("A heptagon has eight sides.", false),
    Question("Fishes cannot blink.", true),
    Question("Finally, seahorses have no teeth or stomach.", true)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("True Citizen"),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
        ),
        backgroundColor: Colors.blueGrey,
        // we use Builder to use a context that is a descendant of scaffold
        body: Builder(
          builder: (BuildContext context) => Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    "images/flag.png",
                    width: 250,
                    height: 180,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Container(
                    height: 120,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          questionBank[_currentQuestionIndex].questionText,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RaisedButton(
                      onPressed: _previousQuestion,
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(true, context),
                      color: Colors.blueGrey.shade900,
                      child: Text(
                        "TRUE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () => _checkAnswer(false, context),
                      color: Colors.blueGrey.shade900,
                      child: Text(
                        "FALSE",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    RaisedButton(
                      onPressed: _nextQuestion,
                      color: Colors.blueGrey.shade900,
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ));
  }

  void _checkAnswer(bool choice, BuildContext context) {
    if (choice == questionBank[_currentQuestionIndex].isCorrect) {
      final snackbar = SnackBar(
        content: Text("Correct!"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.green,
      );
      Scaffold.of(context).showSnackBar(snackbar);
      // Correct answer
      debugPrint("Yes Correct");
      setState(() {
        _score++;
        print("Your Score: $_score");
      });
      _nextQuestion();
    } else {
      debugPrint("Incorrect");
      final snackbar = SnackBar(
        content: Text("Incorrect!"),
        duration: Duration(milliseconds: 500),
        backgroundColor: Colors.red,
      );
      Scaffold.of(context).showSnackBar(snackbar);
      _nextQuestion();
    }
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
      print(_currentQuestionIndex);
    });
  }

  void _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
      print(_currentQuestionIndex);
    });
  }
}
