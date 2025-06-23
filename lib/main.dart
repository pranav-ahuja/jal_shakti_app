import 'package:firebase_core/firebase_core.dart';
import 'package:waterapp/Pages/Jal_Dashboard/jal_add_location.dart';
import 'package:waterapp/Pages/Jal_Dashboard/jal_add_pumphouse.dart';
import 'package:waterapp/globals.dart';
import 'package:flutter/material.dart';
import 'package:waterapp/Pages/Jal_Home/jal_home.dart';
import 'package:waterapp/Pages/Jal_Dashboard/jal_dashboard.dart';
import 'Pages/Jal_Dashboard/jal_add_pump_number.dart';
import 'Pages/Jal_Login/jal_login.dart';
import 'Pages/Jal_Login/otp_verify.dart';
import 'Pages/Jal_Signup/jal_signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(The_Jal_App());
}

class The_Jal_App extends StatelessWidget {
  The_Jal_App({super.key});

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      initialRoute: '/',
      routes: {
        'app_main': (context) =>
            Jal_App_Main(screenWidth: screenWidth, screenHeight: screenHeight),
        'get_started': (context) => Jal_App_Main(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
            ),
        'mobile_login': (context) => Jal_Login(),
        'otp_verify': (context) => Jal_OTP_Verify(
              verificationID: '',
            ),
        'sign_up': (context) => Jal_Signup(),
        'jal_dashboard': (context) => Jal_Dashboard(),
        'jal_add_location': (context) => Jal_Add_Location(),
        'add_pump_house': (context) => Jal_Add_PumpHouse(),
        'add_pump': (context) => Jal_Add_Pump_House_Number(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Jal_App_Main(
          screenWidth: screenWidth,
          screenHeight: screenHeight,
        ),
        // body: Jal_Started(),
      ),
    );
  }
}
