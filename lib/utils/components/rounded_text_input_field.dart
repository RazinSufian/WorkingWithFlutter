import 'package:flutter/material.dart';
import '../../res/app_color.dart';

class RoundedTextInputField extends StatefulWidget {

  final String name;
  final bool? isPassword;
  TextInputType? type;
  TextEditingController textEditingController;
  final bool isReadOnly;

  RoundedTextInputField({super.key,
    required this.name,
    required this.textEditingController,
    this.isPassword = false,
    this.type,
    this.isReadOnly = false,
  });

  @override
  State<RoundedTextInputField> createState() => _RoundedTextInputFieldState();
}

class _RoundedTextInputFieldState extends State<RoundedTextInputField> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10),
          child: Text(widget.name, style: TextStyle(fontSize: 18, color: AppColors.blackColor),),
        ),
        Container(
          height: 50,
          padding: const EdgeInsets.only(bottom: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            color: Colors.white,
            border: Border.all( // Specify the border properties
              color: AppColors.activeBGColor, // Set the border color
              width: 0.9, // Set the border width
            ),
          ),
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  readOnly: widget.isReadOnly,
                  style: TextStyle(fontSize: 13),
                  keyboardType: widget.type,
                  controller: widget.textEditingController,
                  obscureText:  widget.isPassword! ? _obscureText : false,
                  decoration: InputDecoration(
                    hintText: widget.name,
                    hintStyle: const TextStyle(color: AppColors.grayColor),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


