import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


import '../../res/audio_assets.dart'; // Adjust the import path according to your project structure

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  bool isPlaying = false;
  String currentAudio = '';

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

  void _playAudio(String audioPath) async {
    if (isPlaying && currentAudio == audioPath) {
      await _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      await _audioPlayer.play(AssetSource(audioPath));
      setState(() {
        isPlaying = true;
        currentAudio = audioPath;
      });
    }
  }

  Widget _buildAudioCard(String audioPath, String title) {
    return Card(
      child: ListTile(
        title: Text(title),
        trailing: IconButton(
          icon: Icon(
            isPlaying && currentAudio == audioPath ? Icons.pause : Icons.play_arrow,
          ),
          onPressed: () => _playAudio(audioPath),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildAudioCard(AudioAssets.deepBlue, 'Deep Blue'),
            _buildAudioCard(AudioAssets.miles500, '500 Miles'),
            // Add more cards here if you add more audio assets
          ],
        ),
      ),
    );
  }
}
