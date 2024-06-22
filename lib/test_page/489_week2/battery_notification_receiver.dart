import 'package:flutter/material.dart';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';

class BatteryReceiverScreen extends StatefulWidget {
  @override
  _BatteryReceiverScreenState createState() => _BatteryReceiverScreenState();
}

class _BatteryReceiverScreenState extends State<BatteryReceiverScreen> {
  final BatteryInfoPlugin _batteryInfoPlugin = BatteryInfoPlugin();
  int? _batteryLevel;

  @override
  void initState() {
    super.initState();
    _initBatteryInfo();
  }

  Future<void> _initBatteryInfo() async {
    try {
      final androidBatteryInfo = await _batteryInfoPlugin.androidBatteryInfo;
      if (mounted) {
        setState(() {
          _batteryLevel = androidBatteryInfo?.batteryLevel;
        });
      }
    } catch (e) {
      print('Failed to get battery info: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Battery Info', style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: _batteryLevel != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Battery Percentage: $_batteryLevel%',
              style: TextStyle(fontSize: 24),
            ),
          ],
        )
            : CircularProgressIndicator(), // Show loading indicator while fetching data
      ),
    );
  }
}


