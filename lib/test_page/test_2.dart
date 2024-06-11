import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VangtiChai extends StatefulWidget {
  @override
  State<VangtiChai> createState() => _VangtiChaiState();
}

class _VangtiChaiState extends State<VangtiChai> {
  int tk_500 = 0;
  int tk_100 = 0;
  int tk_50 = 0;
  int tk_20 = 0;
  int tk_10 = 0;
  int tk_total = 0;

  void addToTaka(int value) {
    setState(() {
      tk_total += value;
    });
  }

  void clearTaka() {
    setState(() {
      tk_total = 0;
    });
  }

  Widget buildDenominationButton(int value) {
    return ElevatedButton(
      onPressed: () => addToTaka(value),
      child: Text('$value Tk'),
    );
  }

  Widget buildCalculatorButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vangti Chai'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Tk: $tk_total',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20),
                  buildDenominationButton(500),
                  buildDenominationButton(100),
                  buildDenominationButton(50),
                  buildDenominationButton(20),
                  buildDenominationButton(10),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1.0,
                ),
                children: [
                  buildCalculatorButton('1', () => addToTaka(1)),
                  buildCalculatorButton('2', () => addToTaka(2)),
                  buildCalculatorButton('3', () => addToTaka(3)),
                  buildCalculatorButton('4', () => addToTaka(4)),
                  buildCalculatorButton('5', () => addToTaka(5)),
                  buildCalculatorButton('6', () => addToTaka(6)),
                  buildCalculatorButton('7', () => addToTaka(7)),
                  buildCalculatorButton('8', () => addToTaka(8)),
                  buildCalculatorButton('9', () => addToTaka(9)),
                  buildCalculatorButton('0', () => addToTaka(0)),
                  GridTile(
                    child: ElevatedButton(
                      onPressed: clearTaka,
                      child: Text('Clear'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
