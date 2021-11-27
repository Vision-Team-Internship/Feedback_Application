import 'dart:async';

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/home/my_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  void initState() {
    // ignore: prefer_const_constructors
    Timer(Duration(seconds: 3), () {
      // ignore: prefer_const_constructors
      Get.offAll(() => MyHomePage());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstant.lightScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  "Visions",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w500,
                    fontSize: 48,
                    color: ThemeConstant.lightScheme.primary,
                  ),
                ),
              ),
            ),
            Lottie.asset(
              "assets/loadings/loading.json",
              fit: BoxFit.contain,
              width: 150,
            ),
            const SizedBox(
              height: 27,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Made with ",
                  style: ThemeConstant.textTheme.caption!
                      .copyWith(color: Colors.grey),
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                Text(
                  " VisionTeam",
                  style: ThemeConstant.textTheme.caption!.copyWith(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
