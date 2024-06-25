import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';


class ImageScaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Scale'),
      ),
      body: Center(
        child: PhotoView(
          imageProvider: NetworkImage('https://staticg.sportskeeda.com/editor/2022/01/9441c-16419200856280-1920.jpg'),
          minScale: PhotoViewComputedScale.contained,
          maxScale: PhotoViewComputedScale.covered * 2,
          backgroundDecoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}