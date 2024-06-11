import 'package:flutter/material.dart';
import 'package:pet/res/app_color.dart';
import 'package:pet/utils/components/Vangti_card.dart';
import '../utils/components/calculator_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VangtiChai(),
    );
  }
}

class VangtiChai extends StatefulWidget {
  @override
  State<VangtiChai> createState() => _VangtiChaiState();
}

class _VangtiChaiState extends State<VangtiChai> {
  String tkTotal = "";
  Map<int, int> denominationCounts = {};

  void addToTaka(String value) {
    setState(() {
      tkTotal += value;
      _updateDenominationCounts();
    });
  }

  void clearTaka() {
    setState(() {
      tkTotal = "";
      denominationCounts = {};
    });
  }

  void _updateDenominationCounts() {
    int total = int.tryParse(tkTotal) ?? 0;
    List<int> denominations = [500, 100, 50, 20, 10, 5, 2, 1];
    Map<int, int> counts = {};

    for (int denom in denominations) {
      if (total >= denom) {
        counts[denom] = total ~/ denom;
        total %= denom;
      } else {
        counts[denom] = 0;
      }
    }

    setState(() {
      denominationCounts = counts;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    double leftWidth = isLandscape ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width / 3;
    double rightWidth = isLandscape ? MediaQuery.of(context).size.width * 0.5 : MediaQuery.of(context).size.width * 2 / 3;
    double availableHeight = MediaQuery.of(context).size.height - 90 - MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF038577),
        title: Text('VangntiChai',
          style: TextStyle(fontSize: 27, color: Colors.white),

        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 90, // Adjust height as needed
            width: double.infinity, // To make the SizedBox full width
            child: Container(
              color: Colors.white, // Example color for the SizedBox
              child: Center(
                child: Text(
                  'Taka: $tkTotal',
                  style: TextStyle(fontSize: 27, color: AppColors.blackColor),
                ),
              ),
            ),
          ),
          // Divider(), // Divider line
          Expanded(
            child: Row(
              children: [
                // First part of the screen
                SizedBox(
                  width: leftWidth,
                  height: availableHeight,
                  child: Container(
                    color: Colors.white,
                    child: Wrap(
                      spacing: 5, // Horizontal spacing between VangtiCount widgets
                      runSpacing: 10, // Vertical spacing between rows of VangtiCount widgets
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 5, top: isLandscape ? 0 : 60),
                          // padding: const EdgeInsets.only(top: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 500,
                            updateNumber: denominationCounts[500] ?? 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 100,
                            updateNumber: denominationCounts[100] ?? 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 50,
                            updateNumber: denominationCounts[50] ?? 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 20,
                            updateNumber: denominationCounts[20] ?? 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 10,
                            updateNumber: denominationCounts[10] ?? 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 5,
                            updateNumber: denominationCounts[5] ?? 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 2,
                            updateNumber: denominationCounts[2] ?? 0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5), // Left margin
                          child: VangtiCount(
                            initialNumber: 1,
                            updateNumber: denominationCounts[1] ?? 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Second part of the screen
                SizedBox(
                  width: rightWidth,
                  height: availableHeight,
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: isLandscape ? 0 : 200),
                        Expanded(
                          child: Wrap(
                            spacing: 10, // Horizontal spacing between CalculatorCards
                            runSpacing: 10, // Vertical spacing between rows of CalculatorCards
                            children: [
                              CalculatorCard(calculatorValue: "0", onTap: () => addToTaka("0")),
                              CalculatorCard(calculatorValue: "1", onTap: () => addToTaka("1")),
                              CalculatorCard(calculatorValue: "2", onTap: () => addToTaka("2")),
                              CalculatorCard(calculatorValue: "3", onTap: () => addToTaka("3")),
                              CalculatorCard(calculatorValue: "4", onTap: () => addToTaka("4")),
                              CalculatorCard(calculatorValue: "5", onTap: () => addToTaka("5")),
                              CalculatorCard(calculatorValue: "6", onTap: () => addToTaka("6")),
                              CalculatorCard(calculatorValue: "7", onTap: () => addToTaka("7")),
                              CalculatorCard(calculatorValue: "8", onTap: () => addToTaka("8")),
                              CalculatorCard(calculatorValue: "9", onTap: () => addToTaka("9")),
                              CalculatorCard(calculatorValue: "clear", width: 160, height: 55, onTap: clearTaka),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
