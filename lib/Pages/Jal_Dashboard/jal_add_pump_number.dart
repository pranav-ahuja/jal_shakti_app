import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/globals.dart';
import '../../Utility/common_classes_functions.dart';

class Jal_Add_Pump_House_Number extends StatefulWidget {
  const Jal_Add_Pump_House_Number({super.key});

  @override
  State<Jal_Add_Pump_House_Number> createState() =>
      _Jal_Add_Pump_House_NumberState();
}

class _Jal_Add_Pump_House_NumberState extends State<Jal_Add_Pump_House_Number> {
  final TextEditingController _search_location = TextEditingController();
  // final TextEditingController _last_name = TextEditingController();
  // final TextEditingController _email_id = TextEditingController();

  String pump_number = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Pump Number",
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
                text_field_label: "Enter Pump Number",
                text_field_color: kPrimaryWhite,
                on_changed: (value) {
                  pump_number = value;
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
                  app_data_base["pump_number"] = pump_number;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    'jal_dashboard',
                    (route) => false,
                  );
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
