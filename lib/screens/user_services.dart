import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  //method to stroe the username and email
  static Future<void> storeUserDetails({
    required String email,
    required String password,
    required String userName,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      //check wheter the user entered password and confirm password are same
      if (password != confirmPassword) {
        //show a message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password and confirm password do not match")),
        );
        return;
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("userName", userName);
      await prefs.setString("email", email);

      //show a message to the user
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Username and email saved")));
    } catch (err) {
      err.toString();
    }
  }
}
