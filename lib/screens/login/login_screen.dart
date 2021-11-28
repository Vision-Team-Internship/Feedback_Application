// ignore_for_file: unused_field, prefer_typing_uninitialized_variables, avoid_print

import 'dart:convert';
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/home/my_home_screen.dart';
import 'package:feedback_application_flutter/screens/widgets/f_textfield.dart';
import 'package:flutter/material.dart';
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
  bool? _isLoading;
  @override
  void initState() {
    _emailController = TextEditingController();
    _passController = TextEditingController();
    visible = false;
    _isLoading = true;
    super.initState();
  }

  signIn(String email, String password) async {
    var jsonData;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    http.Response response = await http.post(
      Uri.parse("https://feedback-project-api.herokuapp.com/login"),
      headers: <String, String>{
        'Content-Type': 'application/json-patch+json',
        'accept': 'application/json'
      },
      body: <dynamic, dynamic>{
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      jsonData = json.decode(response.body);
      setState(() {
        _isLoading = false;
        sharedPreferences.setString("token", jsonData['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const MyHomePage()),
            (route) => false);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    // ignore: unused_local_variable
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
          child: SafeArea(
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
                        style: ThemeConstant.textTheme.headline3!.copyWith(
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
                                text: "Email",
                                validator: (value) {
                                  const pattern =
                                      r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                                  final regExp = RegExp(pattern);

                                  if (value!.isEmpty) {
                                    return 'Please enter an email';
                                  } else if (!regExp.hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  } else {
                                    return null;
                                  }
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
                                text: "Password",
                                validator: (value) {},
                                onChanged: (value) {},
                                obscurText: visible,
                              ),
                            ],
                          ),
                        ),
                        // const TextField(
                        //   decoration: InputDecoration(
                        //     hintStyle: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w400,
                        //       fontFamily: 'Poppins',
                        //     ),
                        //     hintText: "Username",
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),
                        // const SizedBox(height: 25),
                        // const TextField(
                        //   decoration: InputDecoration(
                        //     hintText: "Email",
                        //     hintStyle: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w400,
                        //       fontFamily: 'Poppins',
                        //     ),
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),
                        // SizedBox(
                        //   height: 71,
                        //   child: TextFieldText(
                        //     text: "demo@gmail.com",
                        //     validator: (value) {
                        //       const pattern =
                        //           r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                        //       final regExp = RegExp(pattern);

                        //       if (value!.isEmpty) {
                        //         return 'Please enter an email';
                        //       } else if (!regExp.hasMatch(value)) {
                        //         return 'Please enter a valid email';
                        //       } else {
                        //         return null;
                        //       }
                        //     },
                        //     onChanged: (value) => setState(() => email = value),
                        //   ),
                        // ),
                        // const TextField(
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     hintText: "Password",
                        //     hintStyle: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.w400,
                        //       fontFamily: 'Poppins',
                        //     ),
                        //     border: OutlineInputBorder(),
                        //   ),
                        // ),

                        const SizedBox(
                          height: 36,
                        ),
                        // ignore: deprecated_member_use
                        Align(
                          alignment: Alignment.topRight,
                          // ignore: deprecated_member_use
                          child: OutlineButton(
                            onPressed: () async {
                              login();
                            },
                            textColor: ThemeConstant.lightScheme.primary,
                            borderSide: BorderSide(
                              color: ThemeConstant.lightScheme.primary,
                            ),
                            // ignore: prefer_const_constructors
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 14.0),
                              child: Text(
                                "Login",
                                style: ThemeConstant.textTheme.button!.copyWith(
                                  color: ThemeConstant.lightScheme.primary,
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
          ),
        ),
      ),
    );
  }

  void login() async {
    if (_emailController!.text.isNotEmpty && _passController!.text.isNotEmpty) {
      var response = await http.post(
        Uri.parse("https://feedback-project-api.herokuapp.com/login"),
        headers: <String, String>{},
        body: ({
          "email": _emailController!.text,
          "password": _passController!.text,
        }),
      );
      if (response.statusCode == 200) {
        print("Login Token  " + response.body);
        pageRoute(response.body);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Error Credentail",
            ),
          ),
        );
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyHomePage()));
  }
}
