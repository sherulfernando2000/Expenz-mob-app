import 'package:flutter/material.dart';
import 'package:flutter2/constants/colors.dart';
import 'package:flutter2/constants/constants.dart';
import 'package:flutter2/screens/main_screen.dart';
import 'package:flutter2/screens/user_services.dart';
import 'package:flutter2/widgets/custom_button.dart';

class UserDataScreen extends StatefulWidget {
  const UserDataScreen({super.key});

  @override
  State<UserDataScreen> createState() => _UserDataScreenState();
}

class _UserDataScreenState extends State<UserDataScreen> {
  bool _rememberMe = false;

  final _formkey = GlobalKey<FormState>();

  //controller for the text from feilds
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              children: [
                Text(
                  "Enter your personal Detials",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 30),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          //check whether the user entered a valid userName
                          if (value!.isEmpty) {
                            return "Please enter your name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      SizedBox(height: 20),

                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          //check whether the user entered a valid userName
                          if (value!.isEmpty) {
                            return "Please enter your email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      SizedBox(height: 20),

                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          //check whether the user entered a valid userName
                          if (value!.isEmpty) {
                            return "Please enter your password";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      SizedBox(height: 20),

                      TextFormField(
                        controller: _confirmPasswordController,
                        validator: (value) {
                          //check whether the user entered a valid userName
                          if (value!.isEmpty) {
                            return "Please enter the same password";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          contentPadding: const EdgeInsets.all(20),
                        ),
                      ),

                      SizedBox(height: 20),

                      Row(
                        children: [
                          const Text(
                            "Remember Me for the next time",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kGrey,
                            ),
                          ),
                          Expanded(
                            child: CheckboxListTile(
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

                      SizedBox(height: 20),

                      GestureDetector(
                        onTap: () async {
                          if (_formkey.currentState!.validate()) {
                            //form is valid process data
                            String userName = _userNameController.text;
                            String email = _emailController.text;
                            String password = _passwordController.text;
                            String confirmPassword =
                                _confirmPasswordController.text;

                            print(
                              "$userName $email $password $confirmPassword",
                            );
                            //save username and email in device storage
                            await UserServices.storeUserDetails(
                              email: email,
                              password: password,
                              userName: userName,
                              confirmPassword: confirmPassword,
                              context: context,
                            );

                            if (context.mounted) {
                               Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context){
                                  return const MainScreen();
                                },
                              ),
                            );
                            }
                           
                          }
                        },
                        child: const CustumButton(
                          buttonName: "Signup",
                          buttonColor: kMainColor,
                        ),
                      ),
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
