import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:waterapp/constant.dart';
import '../Data_Models/user_login_data.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //Pointing to the root of database
  final _database = FirebaseFirestore.instance;

  //Creating users
  Future<void> createUser(UserLoginData user) async {
    //Add the data to the user collection in the database
    await _database
        .collection("user")
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
            "SUCCESS",
            "Your account has been created",
            backgroundColor: kPrimaryBlue,
            snackPosition: SnackPosition.BOTTOM,
            colorText: kPrimaryWhite,
          ),
        )
        .catchError((error, stackTrace) {
      Get.snackbar(
        "ERROR",
        "Something went wrong. Try again",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: kPrimaryBlue,
        colorText: kPrimaryWhite,
      );
      print(error.toString());
    });
  }
}
