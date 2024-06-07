import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../res/app_color.dart';

class VangtiChai extends StatefulWidget {

  @override
  State<VangtiChai> createState() => _VangtiChaiState();
}

class _VangtiChaiState extends State<VangtiChai> {

  int tk_500 = 0;
  int tk_100 = 0;
  int tk_50 = 0;
  int tk_20 = 0;
  int tk_10 = 0;
  int tk_5 = 0;
  int tk_2 = 0;
  int tk_1 = 0;
  int tk_total = 0;




  void addToTaka (int value) {
    setState(() {
      tk_total+= value;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Vangti Chai'),
        backgroundColor: AppColors.activeBGColor,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Total Tk: $tk_total',
              style: TextStyle(fontSize: 24),
            ),
            

          ],
        ),


      )



    );
  }
}
