import 'package:flutter/material.dart';

class BroadcastReceiverScreen extends StatefulWidget {
  @override
  _BroadcastReceiverScreenState createState() => _BroadcastReceiverScreenState();
}

class _BroadcastReceiverScreenState extends State<BroadcastReceiverScreen> {
  String selectedBroadcast = 'Custom broadcast receiver';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Broadcast Receiver'),
      ),
      // body: Column(
      //   children: <Widget>[
      //     DropdownButton<String>(
      //       value: selectedBroadcast,
      //       onChanged: (String newValue) {
      //         setState(() {
      //           selectedBroadcast = newValue;
      //         });
      //       },
      //       items: <String>[
      //         'Custom broadcast receiver',
      //         'System battery notification receiver'
      //       ].map<DropdownMenuItem<String>>((String value) {
      //         return DropdownMenuItem<String>(
      //           value: value,
      //           child: Text(value),
      //         );
      //       }).toList(),
      //     ),
      //     ElevatedButton(
      //       onPressed: () {
      //         if (selectedBroadcast == 'Custom broadcast receiver') {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => CustomBroadcastReceiverInputScreen()),
      //           );
      //         } else {
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(builder: (context) => BatteryNotificationReceiverScreen()),
      //           );
      //         }
      //       },
      //       child: Text('Next'),
      //     ),
      //   ],
      // ),
    );
  }
}

class CustomBroadcastReceiverInputScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Broadcast Receiver'),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Enter text to broadcast'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomBroadcastReceiverScreen(message: _controller.text)),
              );
            },
            child: Text('Broadcast'),
          ),
        ],
      ),
    );
  }
}

class BatteryNotificationReceiverScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implement battery notification logic here
    return Scaffold(
      appBar: AppBar(
        title: Text('Battery Notification Receiver'),
      ),
      body: Center(
        child: Text('Battery percentage will be shown here.'),
      ),
    );
  }
}

class CustomBroadcastReceiverScreen extends StatelessWidget {
  final String message;

  CustomBroadcastReceiverScreen({required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Broadcast Receiver'),
      ),
      body: Center(
        child: Text('Received message: $message'),
      ),
    );
  }
}
