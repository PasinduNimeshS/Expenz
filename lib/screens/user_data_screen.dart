import 'package:expenz/constants/colors.dart';
import 'package:expenz/constants/constants.dart';
import 'package:expenz/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  //for the check box
  bool _rememberMe = false;

  //form key for the form validations
  final _formKey = GlobalKey<FormState>();

  //controllor for the text form field
  final TextEditingController _userNameControllor = TextEditingController();
  final TextEditingController _emailControllor = TextEditingController();
  final TextEditingController _passwordControllor = TextEditingController();
  final TextEditingController _confirmPasswordControllor =
      TextEditingController();

  @override
  void dispose() {
    _userNameControllor.dispose();
    _emailControllor.dispose();
    _passwordControllor.dispose();
    _confirmPasswordControllor.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kDefalutPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Enter your \nPersonal Details",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //from field for the user name
                      TextFormField(
                        controller: _userNameControllor,
                        validator: (value) {
                          //check weather user entered the valid user name
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Name",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //from field for the Email
                      TextFormField(
                        controller: _emailControllor,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter your Email";
                          }
                        },
                        decoration: InputDecoration(
                            hintText: "Email",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //from field for the Psssword
                      TextFormField(
                        controller: _passwordControllor,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please Enter Valid Password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //from field for the User Confirm Psssword
                      TextFormField(
                        controller: _confirmPasswordControllor,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter the same password";
                          }
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      Row(
                        children: [
                          Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: kGrey),
                          ),
                          Expanded(
                            child: CheckboxListTile(
                              activeColor: kMainColor,
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            //formm is valid process data
                            String userName = _userNameControllor.text;
                            String email = _emailControllor.text;
                            String password = _passwordControllor.text;
                            String confirmPassword =
                                _confirmPasswordControllor.text;

                            print(
                                "$userName $email $password $confirmPassword");
                          }
                        },
                        child: CustomButton(
                            buttonName: "Submit", buttonColor: kMainColor),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
