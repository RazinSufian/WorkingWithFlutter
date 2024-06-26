import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  final _controller = YoutubePlayerController();

  @override
  void initState() {
    super.initState();
    _controller.loadVideoById(videoId: 'r1Fx0tqK5Z4');
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: YoutubePlayer(
            controller: _controller,
            aspectRatio: 16 / 9,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.playerState == PlayerState.playing) {
              _controller.pauseVideo();
            } else {
              _controller.playVideo();
            }
          });
        },
        child: Icon(
          _controller.value.playerState == PlayerState.playing ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
