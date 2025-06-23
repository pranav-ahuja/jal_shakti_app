import 'package:flutter/material.dart';
import 'package:waterapp/Utility/common_classes_functions.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/globals.dart';

class Jal_App_Main extends StatefulWidget {
  const Jal_App_Main({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final screenWidth;
  final screenHeight;

  @override
  State<Jal_App_Main> createState() => _Jal_App_MainState();
}

class _Jal_App_MainState extends State<Jal_App_Main> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            color: kPrimaryWhite,
            child: blue_logo_image,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            color: kPrimaryBlue,
            child: Center(
              child: Jal_Elevated_Button(
                  context: context,
                  button_text: "Get Started",
                  button_width: screenWidth,
                  button_height: screenHeight / 17,
                  button_text_size: 25.0,
                  on_pressed: () {
                    Navigator.pushNamed(context, 'mobile_login');
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => Jal_Login(),
                    //   ),
                    // );
                  }),
            ),
          ),
        ),
      ],
    );
  }
}
