import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Two-Part Screen'),
        ),
        body: Row(
          children: [
            // First half of the screen
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue, // Background color for the first half
              ),
            ),
            // Second half of the screen
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.green, // Background color for the second half
              ),
            ),
          ],
        ),
      ),
    );
  }
}
