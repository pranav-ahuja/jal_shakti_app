import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:waterapp/Pages/Jal_Signup/jal_signup.dart';
import 'package:waterapp/globals.dart';
import 'package:flutter/material.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/Utility/common_classes_functions.dart';

class Jal_OTP_Verify extends StatefulWidget {
  Jal_OTP_Verify({
    super.key,
    required this.verificationID,
  });

  String verificationID;
  @override
  State<Jal_OTP_Verify> createState() => _Jal_OTP_VerifyState();
}

class _Jal_OTP_VerifyState extends State<Jal_OTP_Verify> {
  final TextEditingController _otp_controller1 = TextEditingController();

  late String otp;

  void get_user_id() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      app_data_base["user_id"] = user.uid;
    }
  }

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
                  'assets/images/logo_white_small.png',
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
                    Jal_CreateTextField(
                      controller: _otp_controller1,
                      text_field_label: "Verify Otp",
                      text_field_color: kPrimaryWhite,
                      textAlign: TextAlign.center,
                      on_changed: (value) {
                        otp = value;
                        app_data_base["otp"] = otp;
                      },
                    ),
                    SizedBox(
                      height: screenHeight / 20,
                    ),
                    Jal_Elevated_Button(
                      context: context,
                      button_height: screenHeight / 17,
                      button_width: screenWidth,
                      button_text: "Confirm",
                      button_text_size: 25.0,
                      on_pressed: () async {
                        try {
                          print("Verification ID ${widget.verificationID}");
                          PhoneAuthCredential credential =
                              await PhoneAuthProvider.credential(
                            verificationId: widget.verificationID,
                            smsCode: otp,
                          );
                          FirebaseAuth.instance
                              .signInWithCredential(credential)
                              .then((value) {
                            get_user_id();
                            print("User ID is - ${app_data_base["user_id"]}");
                            //TODO: Check if the user is new existing
                            Navigator.pushNamed(context, 'sign_up');
                          });
                        } catch (exception) {
                          print(exception.toString());
                        }
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
