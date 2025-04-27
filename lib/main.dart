import "package:flutter/material.dart";

void main() {
  runApp(const The_Jal_App());
}

class The_Jal_App extends StatelessWidget {
  const The_Jal_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Container(),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
