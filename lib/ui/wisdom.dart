import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  bool _toggleBtn = false;
  List qoutes = [
    "It is better to remain silent at the risk of being thought a fool, than to talk and remove all doubt of it.",
    "The fool doth think he is wise, but the wise man knows himself to be a fool",
    "Whenever you find yourself on the side of the majority, it is time to reform (or pause and reflect).",
    "When someone loves you, the way they talk about you is different. You feel safe and comfortable.",
    "Knowing yourself is the beginning of all wisdom.",
    "The only true wisdom is in knowing you know nothing.",
    "The saddest aspect of life right now is that science gathers knowledge faster than society gathers wisdom.",
    "Count your age by friends, not years. Count your life by smiles, not tears.",
    "May you live every day of your life.",
    "Never laugh at live dragons.",
    "It is the mark of an educated mind to be able to entertain a thought without accepting it.",
    "The secret of life, though, is to fall seven times and to get up eight times.",
    "Any fool can know. The point is to understand.",
    "Think before you speak. Read before you think.",
    "Never let your sense of morals prevent you from doing what is right.",
    "The unexamined life is not worth living.",
    "Turn your wounds into wisdom.",
    "The simple things are also the most extraordinary things, and only the wise can see them.",
    "There are three things all wise men fear: the sea in storm, a night with no moon, and the anger of a gentle man.",
    "Angry people are not always wise.",
    "Let no man pull you so low as to hate him.",
    "Yesterday I was clever, so I wanted to change the world. Today I am wise, so I am changing myself."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wisdom App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Center(
              child: Container(
                width: 350,
                height: 200,
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    qoutes[_index % qoutes.length],
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Divider(
            thickness: 2.2,
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: FlatButton.icon(
              onPressed: _showQoute,
              color: Colors.greenAccent.shade700,
              icon: _toggleBtn
                  ? Icon(
                      Icons.lightbulb_outline_sharp,
                      color: Colors.yellowAccent,
                    )
                  : Icon(
                      Icons.lightbulb_outline,
                      color: Colors.blueAccent,
                    ),
              label: Text(
                "Inspire Me!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }

  void _showQoute() {
    debugPrint("Next Qoute");
    // increment index counter

    setState(() {
      _index += 1;
      _toggleBtn = !_toggleBtn;
    });
  }
}
