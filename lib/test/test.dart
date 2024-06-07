import 'dart:math';
import 'package:flutter/material.dart';
import '../routes/routes_name.dart';

class SuccessPage extends StatefulWidget {
  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  int leftNumber = 0;
  int rightNumber = 0;
  int score = 0;
  final Random random = Random();

  void generateRandomNumbers() {
    setState(() {
      leftNumber = random.nextInt(100);
      rightNumber = random.nextInt(100);
    });
  }

  void addToScore(int value) {
    setState(() {
      score += value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Number Game'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Score: $score',
            style: TextStyle(fontSize: 24),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => addToScore(leftNumber),
                  child: Text('Left: $leftNumber'),
                ),
                ElevatedButton(
                  onPressed: () => addToScore(rightNumber),
                  child: Text('Right: $rightNumber'),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  RoutesName.week1_489,
                );
              },
              child: Text("End Task"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: generateRandomNumbers,
        child: Icon(Icons.refresh),
      ),
    );
  }
}

