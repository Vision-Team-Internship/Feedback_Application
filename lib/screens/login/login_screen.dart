// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, avoid_print, unused_local_variable

import 'dart:convert';
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/home/my_home_screen.dart';
import 'package:feedback_application_flutter/screens/widgets/f_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController? _emailController;
  TextEditingController? _passController;
  late bool visible;
  bool _isLoading = true;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    visible = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    String? email;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: _isLoading
              ? SafeArea(
                  child: Container(
                    color: Colors.white,
                    height: MediaQuery.of(context).size.height,
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Vision",
                              style:
                                  ThemeConstant.textTheme.headline3!.copyWith(
                                color: ThemeConstant.lightScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Login",
                                style: ThemeConstant.textTheme.headline5!
                                    .copyWith(color: Colors.black),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    //Enter Email
                                    TextFieldText(
                                      controller: _emailController,
                                      hinttext: "Enter email",
                                      validator: (value) {
                                        const pattern =
                                            r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+/.[a-zA-Z0-9-.]+$)';
                                        final regExp = RegExp(pattern);

                                        if (value!.isEmpty) {
                                          return 'Please enter an email';
                                        } else {
                                          return null;
                                        }
                                        // else if (!regExp.hasMatch(value)) {
                                        //   return 'Please enter a valid email';
                                        // }
                                      },
                                      onChanged: (value) =>
                                          setState(() => email = value),
                                      obscurText: false,
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),

                                    //Enter Password
                                    TextFieldText(
                                      controller: _passController,
                                      hinttext: "Enter password",
                                      sufixIcon: IconButton(
                                        icon: Icon(
                                          // Based on passwordVisible state choose the icon
                                          visible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                        onPressed: () {
                                          // Update the state i.e. toogle the state of passwordVisible variable
                                          setState(() {
                                            visible = !visible;
                                          });
                                        },
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return "Enter your password";
                                        }
                                        if (value.length <= 5) {
                                          return "Please enter 6 digit";
                                        }
                                      },
                                      onChanged: (value) {},
                                      obscurText: visible,
                                    ),
                                    const SizedBox(
                                      height: 36,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      // ignore: deprecated_member_use
                                      child: OutlineButton(
                                        onPressed: () async {
                                          if (formKey.currentState!
                                              .validate()) {
                                            setState(() {
                                              _isLoading = !_isLoading;
                                            });
                                            login();
                                          }
                                        },
                                        textColor:
                                            ThemeConstant.lightScheme.primary,
                                        borderSide: BorderSide(
                                          color:
                                              ThemeConstant.lightScheme.primary,
                                        ),
                                        // ignore: prefer_const_constructors
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 15.0, horizontal: 14.0),
                                          child: Text(
                                            "Login",
                                            style: ThemeConstant
                                                .textTheme.button!
                                                .copyWith(
                                              color: ThemeConstant
                                                  .lightScheme.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Lottie.asset(
                      "assets/loadings/checking.json",
                      width: 150,
                      height: 150,
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  void login() async {
    if (_emailController!.text.isNotEmpty && _passController!.text.isNotEmpty) {
      Map body = {
        "email": _emailController!.text,
        "password": _passController!.text,
      };
      var jsonResponse;
      var response = await http.post(
        Uri.parse("https://feedback-project-api.herokuapp.com/login"),
        headers: <String, String>{},
        body: body,
      );

      if (response.statusCode == 200) {
        jsonResponse = json.decode(response.body);
        print("Login Token  " + jsonResponse['token']);

        setState(() {
          pageRoute(jsonResponse['token']);
          _isLoading = true;
        });
      } else {
        setState(() {
          _isLoading = true;
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Email and Password is incorrent",
              ),
            ),
          );
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Blank Value Found",
          ),
        ),
      );
    }
  }

  void pageRoute(String token) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", token);
    Get.offAll(() => const MyHomePage());
  }
}
