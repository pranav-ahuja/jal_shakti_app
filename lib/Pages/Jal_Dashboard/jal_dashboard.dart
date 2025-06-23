import 'package:flutter/material.dart';
import 'package:waterapp/constant.dart';
import 'package:waterapp/globals.dart';
import 'package:waterapp/Utility/Dashboard/jal_dashboard_utilities.dart';

class Jal_Dashboard extends StatefulWidget {
  const Jal_Dashboard({super.key});

  @override
  State<Jal_Dashboard> createState() => _Jal_DashboardState();
}

class _Jal_DashboardState extends State<Jal_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        titleTextStyle: TextStyle(
          color: kPrimaryWhite,
          fontWeight: FontWeight.bold,
          fontSize: 25.0,
        ),
        backgroundColor: kPrimaryBlue,
        iconTheme: IconThemeData(
          size: 35,
          color: kPrimaryWhite,
        ),
      ),
      drawer: Drawer(
        child: Builder(
          builder: (context) => ListView(
            children: [
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Jal_Adding_New_Icon(
                          icon: Icons.close,
                          iconSize: 35,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Jal_Text_Output(
                      text_size: 15,
                      text_type: TextType.jal_greeting,
                    ),
                    Jal_Text_Output(
                      text_type: TextType.jal_main_text,
                      text_size: 50,
                      text_font_weight: FontWeight.bold,
                    ),
                  ],
                ),
              ),
              Jal_Menu_List_Tile(
                list_tile_text: "Home",
                list_tile_text_font_weight: FontWeight.w700,
                list_tile_text_size: 20.0,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "jal_dashboard",
                    (route) => false,
                  );
                },
              ),
              Jal_Menu_List_Tile(
                onPressed: () {
                  Navigator.pushNamed(context, "jal_dashboard");
                },
                list_tile_text: "Profile",
                list_tile_text_size: 20.0,
              ),
              Jal_Menu_List_Tile(
                onPressed: () {
                  Navigator.pushNamed(context, "jal_dashboard");
                },
                list_tile_text: "Help & Support",
                list_tile_text_size: 20.0,
              ),
              Jal_Menu_List_Tile(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    "get_started",
                    (route) => false,
                  );
                },
                list_tile_text: "Logout",
                list_tile_text_size: 20.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, "jal_add_location");
        },
        backgroundColor: kPrimaryBlue,
        child: Icon(
          Icons.add,
          color: kPrimaryWhite,
          size: 40.0,
        ),
      ),
      body: InkWell(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle_outline_outlined,
                  size: screenWidth / 3,
                  color: kAddNewDeviceColor,
                ),
                Text(
                  "Add new device",
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: kAddNewDeviceColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          setState(() {
            Navigator.pushNamed(context, "jal_add_location");
          });
        },
      ),
    );
  }
}
