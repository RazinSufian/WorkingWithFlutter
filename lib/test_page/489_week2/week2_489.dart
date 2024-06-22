import 'package:flutter/material.dart';
import 'broadcast_receiver.dart';
import 'image_scale.dart';
import 'massage_sender.dart';
import 'message_receiver.dart';
import 'video_player.dart';
import 'audio_player.dart';
import 'battery_notification_receiver.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSE 489 Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedDrawerIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    BroadcastReceiverScreen(),
    ImageScaleScreen(),
    VideoPlayerScreen(),
    AudioPlayerScreen(),
    MessageBroadcastSenderScreen(),
    MessageBroadcastReceiverScreen(),
    BatteryReceiverScreen(),
  ];

  _getDrawerItemWidget(int pos) {
    return _pages[pos];
  }

  _onSelectItem(int index) {
    setState(() {
      _selectedDrawerIndex = index;
    });
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CSE 489 Assignment'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () => _onSelectItem(0),
            ),
            ExpansionTile(
              title: Text('Broadcast'),
              children: <Widget>[
                ListTile(
                  title: Text('Message Broadcast Sender'),
                  onTap: () => _onSelectItem(5),
                ),
                ListTile(
                  title: Text('Message Broadcast Receiver'),
                  onTap: () => _onSelectItem(6),
                ),
                ListTile(
                  title: Text('Battery Broadcast Receiver'),
                  onTap: () => _onSelectItem(7),
                ),
              ],
            ),
            ListTile(
              title: Text('Image Scale'),
              onTap: () => _onSelectItem(2),
            ),
            ListTile(
              title: Text('Video'),
              onTap: () => _onSelectItem(3),
            ),
            ListTile(
              title: Text('Audio'),
              onTap: () => _onSelectItem(4),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Home'),
    );
  }
}
