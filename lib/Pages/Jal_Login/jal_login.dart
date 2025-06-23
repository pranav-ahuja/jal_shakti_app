import 'package:firebase_core/firebase_core.dart';
import 'package:waterapp/globals.dart';
import 'package:flutter/material.dart';
import 'package:waterapp/constant.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:waterapp/Utility/common_classes_functions.dart';
import 'package:waterapp/Pages/Jal_Login/otp_verify.dart';

import 'package:firebase_auth/firebase_auth.dart';

class Jal_Login extends StatefulWidget {
  const Jal_Login({super.key});

  @override
  State<Jal_Login> createState() => _Jal_LoginState();
}

class _Jal_LoginState extends State<Jal_Login> {
  final TextEditingController _login_controller = TextEditingController();

  late String mobile_number;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyle(
            color: kPrimaryWhite,
          ),
        ),
        backgroundColor: kPrimaryBlue,
        leading: Icon(
          Icons.arrow_back,
          color: kPrimaryWhite,
        ),
      ),
      backgroundColor: kPrimaryBlue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: small_white_logo,
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
                    IntlPhoneField(
                      controller: _login_controller,
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        filled: true,
                        fillColor: kPrimaryWhite,
                        labelStyle: TextStyle(
                          // fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                          borderSide: BorderSide(
                            color: kPrimaryWhite,
                            width: 0.5,
                          ),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        setState(() {
                          mobile_number = _login_controller.text.toString();
                          app_data_base["mobile_number"] = mobile_number;
                        });
                      },
                    ),
                    Jal_Elevated_Button(
                      context: context,
                      button_height: screenHeight / 17,
                      button_width: screenWidth,
                      button_text: "Verify",
                      button_text_size: 25.0,
                      on_pressed: () async {
                        print(mobile_number);
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: "+91$mobile_number",
                          verificationCompleted:
                              (PhoneAuthCredential credentials) async {
                            //Sign in with the credentials without manual input
                            await FirebaseAuth.instance
                                .signInWithCredential(credentials);
                          },
                          verificationFailed:
                              (FirebaseAuthException exception) {},
                          codeSent: (String verificationID, int? resendToken) {
                            if (_login_controller.text.isNotEmpty &&
                                _login_controller.text.length == 10) {
                              print("Verification ID - ${verificationID}");
                              print(app_data_base["mobile_number"]);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Jal_OTP_Verify(
                                      verificationID: verificationID),
                                ),
                              );
                            }
                            if (_login_controller.text.isEmpty) {
                              Jal_create_alert_message(
                                context: context,
                                error_title: "Error:",
                                error_msg: "Mobile number cannot be empty",
                              );
                            }
                          },
                          codeAutoRetrievalTimeout: (String verificationID) {},
                        );
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
