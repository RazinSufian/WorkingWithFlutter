import 'package:flutter/material.dart';
import 'package:pet/res/app_color.dart';
import 'package:pet/routes/routes_name.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    // Sample item dimensions for childAspectRatio calculation
    double itemWidth = 100;
    double itemHeight = 200;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.activeBGColor,
        title: Text('Success Page'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Task Successful',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
