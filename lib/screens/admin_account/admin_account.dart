// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'dart:async';

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminAccontScreen extends StatefulWidget {
  const AdminAccontScreen({Key? key}) : super(key: key);

  @override
  _AdminAccontScreenState createState() => _AdminAccontScreenState();
}

class _AdminAccontScreenState extends State<AdminAccontScreen> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstant.lightScheme.background,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: ThemeConstant.lightScheme.background,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: ThemeConstant.lightScheme.onBackground,
          ),
        ),
        title: Text(
          "Profile",
          style: const TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff000000),
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Get.defaultDialog(
                title: "Logout",
                content: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Text("Are you sure you want to logout ?"),
                ),
                radius: 0.0,
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text(
                      "No",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      SharedPreferences pref =
                          await SharedPreferences.getInstance();
                      pref.remove("login");
                      pref.commit();
                      setState(() {
                        isLoading = !isLoading;
                        Get.back();
                      });

                      Timer(Duration(seconds: 1), () {
                        Get.offAll(() => LoginScreen());
                      });
                    },
                    child: Text(
                      "Yes",
                    ),
                  ),
                ],
              );
            },
            icon: SizedBox(
              width: 25,
              height: 25,
              child: SvgPicture.asset(
                "assets/icons/logout.svg",
              ),
            ),
          )
        ],
      ),
      body: isLoading
          ? Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    header(),
                    InkWell(onTap: () {}, child: nameField()),
                    Divider(
                      color: Color(0xff8B9299),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    InkWell(onTap: () {}, child: emailField()),
                    Divider(
                      color: Color(0xff8B9299),
                    ),
                    SizedBox(
                      height: 29,
                    ),
                    passwordField(),
                  ],
                ),
              ),
            )
          : Center(
              child: SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset("assets/loadings/waiting.json"),
              ),
            ),
    );
  }

  Widget nameField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/account.svg",
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name",
                    style: ThemeConstant.textTheme.headline6!.copyWith(
                        color: ThemeConstant.lightScheme.onBackground),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Chandara",
                    style: ThemeConstant.textTheme.bodyText2!
                        .copyWith(color: ThemeConstant.lightScheme.secondary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            color: Color(0xff8B9299),
          )
        ],
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                "assets/icons/email.svg",
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: ThemeConstant.textTheme.headline6!.copyWith(
                        color: ThemeConstant.lightScheme.onBackground),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    "Dara@dara.com",
                    style: ThemeConstant.textTheme.bodyText2!
                        .copyWith(color: ThemeConstant.lightScheme.secondary),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
          Icon(
            Icons.chevron_right,
            color: Color(0xff8B9299),
          )
        ],
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  "assets/icons/password.svg",
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Password",
                      style: ThemeConstant.textTheme.headline6!.copyWith(
                          color: ThemeConstant.lightScheme.onBackground),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "................................................",
                      style: ThemeConstant.textTheme.bodyText2!
                          .copyWith(color: ThemeConstant.lightScheme.secondary),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
            Icon(
              Icons.chevron_right,
              color: Color(0xff8B9299),
            )
          ],
        ),
      ),
    );
  }

  Widget header() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .38,
      // color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            child: SvgPicture.asset(
              "assets/icons/account.svg",
              color: Colors.white,
              width: 50,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Admin Dashboard",
                  style: ThemeConstant.textTheme.headline5!.copyWith(
                    color: ThemeConstant.lightScheme.onBackground,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Dara@dara.com",
                  style: ThemeConstant.textTheme.subtitle1!.copyWith(
                    color: ThemeConstant.lightScheme.onBackground,
                  ),
                ),
                Text(
                  "010000011",
                  style: ThemeConstant.textTheme.subtitle1!.copyWith(
                    color: ThemeConstant.lightScheme.onBackground,
                  ),
                ),
                // Chip(
                //   backgroundColor: Colors.white,
                //   side: BorderSide(
                //     color: Colors.lightBlue,
                //   ),
                //   labelStyle: TextStyle(
                //     color: ThemeConstant.lightScheme.primary,
                //   ),
                //   label: Text("Edit"),
                // ),
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
