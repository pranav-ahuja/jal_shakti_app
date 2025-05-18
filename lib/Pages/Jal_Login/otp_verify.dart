import 'package:jal_app/Pages/Jal_Signup/jal_signup.dart';
import 'package:jal_app/globals.dart';
import 'package:flutter/material.dart';
import 'package:jal_app/constant.dart';
import 'package:otp_text_field/style.dart';
import 'package:jal_app/Utility/common_classes_functions.dart';
import 'package:otp_text_field/otp_text_field.dart';

class Jal_OTP_Verify extends StatefulWidget {
  const Jal_OTP_Verify({super.key});

  @override
  State<Jal_OTP_Verify> createState() => _Jal_OTP_VerifyState();
}

class _Jal_OTP_VerifyState extends State<Jal_OTP_Verify> {
  final OtpFieldController _otp_controller = OtpFieldController();

  late String mobile_number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify OTP"),
      ),
      backgroundColor: kPrimaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(
                  'assets/logo_white_small.png',
                  width: screenWidth / 2,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // IntlPhoneField
                    OTPTextField(
                      controller: _otp_controller,
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      fieldWidth: 50,
                      style: TextStyle(fontSize: 17),
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      otpFieldStyle: OtpFieldStyle(
                        backgroundColor: kPrimaryWhite,
                      ),
                      fieldStyle: FieldStyle.box,
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      },
                      onChanged: (value) {
                        app_data_base["otp"] = value;
                      },
                    ),
                    SizedBox(
                      height: screenHeight / 20,
                    ),
                    Jal_Elevated_Button(
                      context: context,
                      button_height: screenHeight / 20,
                      button_width: screenWidth,
                      button_text: "Confirm",
                      button_text_size: 25.0,
                      on_pressed: () {
                        setState(() {
                          //TODO 1: Implement the logic to check if the user is new or existing
                          if (app_data_base["otp"] != "") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Jal_Signup(),
                              ),
                            );
                          } else {
                            Jal_create_alert_message(
                                context: context,
                                error_title: "Error",
                                error_msg: "OTP cannot be empty");
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
      ),
    );
  }
}
