import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet/test_page/489_week2/massage_controller.dart';
import 'package:pet/utils/components/custom_button.dart';
import '../../utils/components/round_text_bar.dart';
import 'message_receiver.dart'; // Import the MessageBroadcastReceiverScreen

class MessageBroadcastSenderScreen extends StatelessWidget {
  final MassageController massageController = Get.put(MassageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message Broadcast Sender'),
      ),
      body: Column(
        children: [
          SizedBox(height: 50),
          RoundInputField(
            name: "Name",
            onChanged: (value) {
              massageController.nameTextController = value;
            },
            onSubmitted: (value) {
              massageController.nameTextController = value;
            },
          ),
          SizedBox(height: 20),
          RoundInputField(
            name: "Message",
            height: 250,
            // hintTextAlignment: "top",
            onChanged: (value) {
              massageController.massageTextController = value;
            },
            onSubmitted: (value) {
              massageController.massageTextController = value;
            },
          ),
          SizedBox(height: 20),
          CustomButton(
            text: "Send",
            onPressed: () {
              // Navigate to MessageBroadcastReceiverScreen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => MessageBroadcastReceiverScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
