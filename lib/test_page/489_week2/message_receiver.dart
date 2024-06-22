import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/test_page/489_week2/massage_controller.dart';

class MessageBroadcastReceiverScreen extends StatelessWidget {
  final MassageController massageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Message Broadcast Receiver"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding around the text box
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 50),
              Container(
                height: 60.0, // Set the height of the name TextField
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0), // Set the border radius
                  border: Border.all(color: Colors.grey), // Optional: add a border
                ),
                child: TextField(
                  controller: TextEditingController(
                    text: massageController.nameTextController.isEmpty
                        ? "nothing received yet"
                        : massageController.nameTextController,
                  ),
                  readOnly: true, // Make the text field read-only
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), // Match the border radius
                      borderSide: BorderSide.none, // Remove default border
                    ),
                    labelText: 'Name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  ),
                ),
              ),
              SizedBox(height: 60.0), // Spacing between the text boxes
              Container(
                height: 200.0, // Set the height of the message TextField
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0), // Set the border radius
                  border: Border.all(color: Colors.grey), // Optional: add a border
                ),
                child: TextField(
                  controller: TextEditingController(
                    text: massageController.massageTextController.isEmpty
                        ? "nothing received yet"
                        : massageController.massageTextController,
                  ),
                  readOnly: true, // Make the text field read-only
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0), // Match the border radius
                      borderSide: BorderSide.none, // Remove default border
                    ),
                    labelText: 'Message',
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
                  ),
                  maxLines: null, // Allow the message box to be multi-line
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
