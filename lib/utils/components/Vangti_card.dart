import 'package:flutter/material.dart';


class VangtiCount extends StatefulWidget {
  final int initialNumber;
  final int updateNumber;

  VangtiCount({required this.initialNumber, required this.updateNumber});

  @override
  _VangtiCountState createState() => _VangtiCountState();
}

class _VangtiCountState extends State<VangtiCount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, // Define the width of the box
      height: 60, // Define the height of the box
      alignment: Alignment.center, // Center the text within the container
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        border: Border.all(
          color: Colors.transparent, // Border color
          width: 2, // Border width
        ),
      ),
      child: Text(
        '${widget.initialNumber}: ${widget.updateNumber}',
        style: TextStyle(fontSize: 23),
        textAlign: TextAlign.center, // Center align the text
      ),
    );
  }
}





// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Vangti Count Example')),
//         body: Center(
//           child: DummyClass(),
//         ),
//       ),
//     );
//   }
// }
//


// class DummyClass extends StatefulWidget {
//   @override
//   _DummyClassState createState() => _DummyClassState();
// }
//
// class _DummyClassState extends State<DummyClass> {
//   final Map<int, int> _values = {
//     500: 0,
//     200: 0,
//     // Add more initial values as needed
//   };
//
//   void updateCounter(int initialNumber, int newValue) {
//     setState(() {
//       _values[initialNumber] = newValue;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         for (var entry in _values.entries)
//           VangtiCount(
//             initialNumber: entry.key,
//             updateNumber: entry.value,
//           ),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: () {
//             // Example: Update the counter for initial number 500
//             updateCounter(300, _values[300]! + 2); // Increment by 2 for demonstration
//           },
//           child: Text('Update 500 Counter'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             // Example: Update the counter for initial number 200
//             updateCounter(200, _values[200]! + 3); // Increment by 3 for demonstration
//           },
//           child: Text('Update 200 Counter'),
//         ),
//       ],
//     );
//   }
// }
