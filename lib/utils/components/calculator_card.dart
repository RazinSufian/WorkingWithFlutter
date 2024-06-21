import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorCard extends StatelessWidget {
  final String calculatorValue;
  final double width;
  final double height;
  final VoidCallback onTap;

  CalculatorCard({
    required this.calculatorValue,
    required this.onTap,
    this.width = 75.0,
    this.height = 55.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xFFd6d7d7),
          border: Border.all(
            color: Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          '$calculatorValue',
          style: TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}