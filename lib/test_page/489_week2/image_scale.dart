import 'package:flutter/material.dart';
import 'package:flutter_zoomable_image/flutter_zoomable_image.dart';

class ImageScaleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Scale'),
      ),
      body: Center(
        child: ZoomableImage(
          NetworkImage('https://example.com/image.jpg'),
        ),
      ),
    );
  }
}
