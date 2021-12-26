import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  _closeButton() {
    print('button closed');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold Example'),
        centerTitle: false,
        backgroundColor: Colors.amberAccent.shade700,
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => print('Icon button'),
          ),
          IconButton(icon: Icon(Icons.cancel), onPressed: _closeButton)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreen,
        child: Icon(Icons.call),
        onPressed: () => print('calling you...'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text('Account')),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail), title: Text("Messages")),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), title: Text("Notification")),
        ],
        onTap: (int index) => debugPrint("Tapped Item $index"),
      ),
      backgroundColor: Colors.blueAccent,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton()
            // InkWell(
            //   child: Text(
            //     "Tap Me!",
            //     style: TextStyle(
            //       fontSize: 25,
            //     ),
            //   ),
            //   onTap: () => print('tapped....'),
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Gesture Detector"),
          backgroundColor: Colors.amberAccent,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.pinkAccent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text("Button"),
      ),
    );
  }
}
