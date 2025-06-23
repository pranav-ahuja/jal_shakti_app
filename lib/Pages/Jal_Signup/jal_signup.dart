import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:waterapp/Backend/Data_Models/user_login_data.dart';
import 'package:waterapp/Backend/Data_Repository/user_repository.dart';
import 'package:waterapp/globals.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/Utility/common_classes_functions.dart';

class Jal_Signup extends StatefulWidget {
  const Jal_Signup({super.key});

  @override
  State<Jal_Signup> createState() => _Jal_SignupState();
}

class _Jal_SignupState extends State<Jal_Signup> {
  @override
  final TextEditingController _first_name = TextEditingController();
  final TextEditingController _last_name = TextEditingController();
  final TextEditingController _email_id = TextEditingController();

  String first_name_string = "";
  String last_name_string = "";
  String email_id_string = "";

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      backgroundColor: kPrimaryBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Image.asset(
              'assets/logo_white_small.png',
              width: screenWidth / 2,
            ),
          ),
          Expanded(
            flex: 1,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  Jal_CreateTextField(
                    controller: _first_name,
                    text_field_color: kPrimaryWhite,
                    text_field_label: "First Name",
                    // output: first_name_string,
                    on_changed: (value) {
                      first_name_string = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Jal_CreateTextField(
                    controller: _last_name,
                    text_field_label: "Last Name",
                    text_field_color: kPrimaryWhite,
                    on_changed: (value) {
                      last_name_string = value;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Jal_CreateTextField(
                    controller: _email_id,
                    text_field_label: "Email ID",
                    text_field_color: kPrimaryWhite,
                    on_changed: (value) {
                      email_id_string = value;
                    },
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Jal_Elevated_Button(
                    context: context,
                    button_text: "Sign Up",
                    button_width: screenWidth,
                    button_height: screenHeight / 17,
                    button_text_size: 25.0,
                    on_pressed: () {
                      setState(() async {
                        app_data_base["first_name"] = first_name_string;
                        app_data_base["last_name"] = last_name_string;
                        app_data_base["email_id"] = email_id_string;

                        final user = UserLoginData(
                          firstName: _first_name.text,
                          lastName: _last_name.text,
                          email: _email_id.text,
                        );
                        await Get.put(UserRepository()).createUser(user);

                        if (_last_name.text.isNotEmpty ||
                            _first_name.text.isNotEmpty ||
                            _email_id.text.isNotEmpty) {
                          if (_email_id.text.endsWith(".com") ||
                              _email_id.text.endsWith(".co") ||
                              _email_id.text.endsWith(".in")) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, "jal_dashboard", (route) => false);
                          }
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
