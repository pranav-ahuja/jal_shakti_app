library globals;

double screenWidth = 0;
double screenHeight = 0;

class App_Data_Base {
  String mobile_number;

  App_Data_Base({
    required this.mobile_number,
  });
}

Map<String, dynamic> app_data_base = {
  "user_id": "",
  "mobile_number": "",
  "otp": "",
  "first_name": "",
  "last_name": "",
  "email_id": "",
  "location": "",
  "pump_house": "",
  "pump_number": "",
};

enum TextType {
  // jal_normal,
  jal_greeting,
  jal_main_text,
  // jal_sub_text,
  jal_dashboard_menu_item,
  jal_elevated_button_text,
}
