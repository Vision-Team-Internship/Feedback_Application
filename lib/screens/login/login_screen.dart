import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/message/message_screen.dart';
import 'package:feedback_application_flutter/screens/widgets/b_button.dart';
import 'package:feedback_application_flutter/screens/widgets/f_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  late bool visible;
  @override
  void initState() {
    visible = false;

    super.initState();
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
                          height: 20,
                        ),
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              //Enter Username
                              TextFieldText(
                                hinttext: "Enter username",
                                text: "Username",
                                validator: (value) {},
                                onChanged: (value) {},
                                obscurText: false,
                              ),
                              const SizedBox(
                                height: 25,
                              ),

                              //Enter Email
                              TextFieldText(
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
                          child: ButtonLogin(
                            title: "LOGIN",
                            onTap: () {
                              // ignore: avoid_print
                              print("Login");
                              Get.to(const MessageScreen());
                            },
                            borderColor: const Color(0xFF0080FF),
                            splashIcon: const Color(0x000000ff),
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
}
