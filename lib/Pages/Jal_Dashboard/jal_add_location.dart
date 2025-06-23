import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/globals.dart';

import '../../Utility/common_classes_functions.dart';

class Jal_Add_Location extends StatefulWidget {
  const Jal_Add_Location({super.key});

  @override
  State<Jal_Add_Location> createState() => _Jal_Add_LocationState();
}

class _Jal_Add_LocationState extends State<Jal_Add_Location> {
  final TextEditingController _search_location = TextEditingController();
  // final TextEditingController _last_name = TextEditingController();
  // final TextEditingController _email_id = TextEditingController();

  String location = "";
  String last_name_string = "";
  String email_id_string = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Location",
          style: TextStyle(
            color: kPrimaryWhite,
          ),
        ),
        backgroundColor: kPrimaryBlue,
        iconTheme: IconThemeData(
          color: kPrimaryWhite,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Jal_CreateTextField(
                controller: _search_location,
                text_field_label: "Enter Location",
                text_field_color: kPrimaryWhite,
                on_changed: (value) {
                  location = value;
                }),
            Expanded(
              flex: 15,
              child: Container(),
            ),
            Jal_Elevated_Button(
              context: context,
              button_text: "Next",
              button_width: screenWidth,
              button_height: screenHeight / 30,
              button_text_size: 25.0,
              on_pressed: () {
                setState(() {
                  app_data_base["location"] = location;
                  Navigator.pushNamed(context, 'add_pump_house');
                });
              },
              button_color: kPrimaryBlue,
              button_text_color: kPrimaryWhite,
            ),
          ],
        ),
      ),
    );
  }
}
