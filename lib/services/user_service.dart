import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  //method to store the user name and user email in the shared preferences

  static Future<void> storeUserDetails({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    //If the password and Confirm password are correct ,then store user name and password using shared preferences
    try {
      //check weather the user entered password and the confirm passwords are the same
      if (password != confirmPassword) {
        //show message to the user
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Password and Confirm Password do not match"),
          ),
        );
        return;
      }
      //creat an instance from shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();

      //store the user name and email as keyvalue pairs
      await prefs.setString("username", userName);
      await prefs.setString("email", email);

      //show a message to user
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("User Detaails stored successfull")));
    } catch (err) {
      err.toString();
    }
  }

  //method to check weathr the uuser name is saved in the shared pref
  static Future<bool> checkUserName() async {
    //create an instance for shared preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? userName = pref.getString("username");
    return userName != null;
  }
}
