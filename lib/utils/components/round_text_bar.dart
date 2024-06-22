import 'package:flutter/material.dart';
import '../../res/app_color.dart';

class RoundInputField extends StatefulWidget {
  final String name;
  final bool? isPassword;
  final TextInputType? type;
  final bool isReadOnly;
  final double height;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  RoundInputField({
    Key? key,
    required this.name,
    this.isPassword = false,
    this.type,
    this.isReadOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.height = 50.0,
  }) : super(key: key);

  @override
  State<RoundInputField> createState() => _RoundInputFieldState();
}

class _RoundInputFieldState extends State<RoundInputField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.symmetric(vertical: 2.0), // default padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        border: Border.all(
          color: AppColors.grayColor, // Set the border color to gray
          width: 0.9,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0, top: 0.0, right: 5), // Adjusted padding
        child: TextField(
          readOnly: widget.isReadOnly,
          style: TextStyle(fontSize: 13),
          keyboardType: widget.type,
          obscureText: widget.isPassword! ? _obscureText : false,
          onChanged: widget.onChanged,
          onSubmitted: widget.onSubmitted,
          maxLines: null, // Allow multiple lines
          decoration: InputDecoration(
            hintText: widget.name,
            hintStyle: TextStyle(
              color: AppColors.grayColor,
            ),
            border: InputBorder.none,
            contentPadding: EdgeInsets.zero, // Ensure no extra padding
          ),
          textAlignVertical: TextAlignVertical.top, // Align text to the top
        ),
      ),
    );
  }
}
