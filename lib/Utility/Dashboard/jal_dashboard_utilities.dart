import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/globals.dart';

class Jal_Adding_New_Icon extends StatelessWidget {
  const Jal_Adding_New_Icon({
    super.key,
    required this.icon,
    required this.iconSize,
    required this.onPressed,
  });

  final IconData icon;
  final double iconSize;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        icon,
        size: iconSize,
      ),
      onTap: onPressed,
    );
  }
}

class Jal_Text_Output extends StatelessWidget {
  Jal_Text_Output({
    super.key,
    required this.text_type,
    required this.text_size,
    this.text_font_weight = FontWeight.w400,
    this.text_field_text = "",
    this.text_color = Colors.black,
  });

  final TextType text_type;
  final double text_size;
  Color text_color;
  FontWeight text_font_weight;
  String text_field_text;

  String enter_text() {
    String text = "";

    switch (text_type) {
      case TextType.jal_greeting:
        text = greating();
        break;

      case TextType.jal_main_text:
        text = app_data_base["first_name"];
        break;

      case TextType.jal_dashboard_menu_item:
        text = text_field_text;
        break;

      case TextType.jal_elevated_button_text:
        text = text_field_text;
        break;
    }
    return text;
  }

  String greating() {
    int hour = DateTime.now().hour;

    if (hour >= 5 && hour < 12)
      return "Good Morning";
    else if (hour >= 12 && hour < 17)
      return "Good Afternoon";
    else if (hour >= 17 && hour < 21)
      return "Good Evening";
    else
      return "Good Night";
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      enter_text(),
      style: TextStyle(
        fontSize: text_size,
        fontWeight: text_font_weight,
        color: text_color,
      ),
    );
  }
}

class Jal_Menu_List_Tile extends StatelessWidget {
  Jal_Menu_List_Tile({
    super.key,
    required this.onPressed,
    required this.list_tile_text,
    this.list_tile_text_size = 20.0,
    this.list_tile_text_font_weight = FontWeight.w400,
  });

  final String list_tile_text;
  final onPressed;
  double list_tile_text_size;
  FontWeight list_tile_text_font_weight;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Jal_Text_Output(
        text_type: TextType.jal_dashboard_menu_item,
        text_size: list_tile_text_size,
        text_field_text: list_tile_text,
        text_font_weight: list_tile_text_font_weight,
      ),
      onTap: onPressed,
    );
  }
}
