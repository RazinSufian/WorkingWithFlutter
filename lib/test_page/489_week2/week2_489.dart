import 'package:flutter/material.dart';
import 'broadcast_receiver.dart';
import 'image_scale.dart';
import 'video_player.dart';
import 'audio_player.dart';

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

class MyHomePage extends StatelessWidget {
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
              title: Text('Broadcast Receiver'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BroadcastReceiverScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Image Scale'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImageScaleScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Video'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoPlayerScreen()),
                );
              },
            ),
            ListTile(
              title: Text('Audio'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AudioPlayerScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text('Select an option from the drawer menu'),
      ),
    );
  }
}
