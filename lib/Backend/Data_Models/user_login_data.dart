class UserLoginData {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  //final String password;
  //final String phoneNumber;

  const UserLoginData({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    // required this.password,
    // required this.phoneNumber,
  });

  toJson() {
    return {
      //"user_id": "",
      // "mobile_number": phoneNumber,
      //"otp": "",
      "first_name": firstName,
      "last_name": lastName,
      "email_id": email,
      // "password": password,
      //"location": "",
      //"pump_house": "",
      //"pump_number": "",
    };
  }
}
