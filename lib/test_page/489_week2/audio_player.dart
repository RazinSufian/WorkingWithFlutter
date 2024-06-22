import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // children: <Widget>[
          //   ElevatedButton(
          //     onPressed: () async {
          //       int result = await _audioPlayer.play('https://example.com/audio.mp3');
          //       if (result == 1) {
          //         // success
          //       }
          //     },
          //     child: Text('Play'),
          //   ),
          //   ElevatedButton(
          //     onPressed: () async {
          //       int result = await _audioPlayer.pause();
          //       if (result == 1) {
          //         // success
          //       }
          //     },
          //     child: Text('Pause'),
          //   ),
          //   ElevatedButton(
          //     onPressed: () async {
          //       int result = await _audioPlayer.stop();
          //       if (result == 1) {
          //         // success
          //       }
          //     },
          //     child: Text('Stop'),
          //   ),
          // ],
        ),
      ),
    );
  }
}
