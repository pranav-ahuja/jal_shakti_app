import 'package:flutter/material.dart';
import 'package:waterapp/Utility/Dashboard/jal_dashboard_utilities.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/globals.dart';

//Class to create textField
class Jal_CreateTextField extends StatelessWidget {
  Jal_CreateTextField({
    super.key,
    required this.controller,
    required this.text_field_label,
    required this.text_field_color,
    required this.on_changed,
    this.textAlign = TextAlign.start,
  });

  final TextEditingController controller;
  final String text_field_label;
  final Color text_field_color;
  final on_changed;
  TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textAlign: textAlign,
      decoration: InputDecoration(
        labelText: text_field_label,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
        ),
        filled: true,
        fillColor: text_field_color,
      ),
      onChanged: on_changed,
    );
  }
}

//Function to print alert msg
Future<dynamic> Jal_create_alert_message({
  required BuildContext context,
  required String error_msg,
  required String error_title,
}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: kPrimaryWhite,
        content: Text(
          error_msg,
        ),
        title: Text(
          error_title,
        ),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      );
    },
  );
}

//Function to create elevated button
ElevatedButton Jal_Elevated_Button({
  required BuildContext context,
  required String button_text,
  required double button_width,
  required double button_height,
  required double button_text_size,
  required on_pressed,
  Color button_color = kPrimaryWhite,
  Color button_text_color = kPrimaryBlue,
}) {
  return ElevatedButton(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      ),
      backgroundColor: MaterialStateProperty.all(button_color),
      fixedSize: MaterialStateProperty.all(
        Size(button_width, button_height),
      ),
    ),
    onPressed: on_pressed,
    child: Jal_Text_Output(
      text_type: TextType.jal_elevated_button_text,
      text_field_text: button_text,
      text_size: button_text_size,
      text_font_weight: FontWeight.bold,
      text_color: button_text_color,
    ),
  );
}
