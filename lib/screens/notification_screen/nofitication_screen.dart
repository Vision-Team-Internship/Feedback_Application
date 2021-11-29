// ignore_for_file: prefer_const_constructors

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NofiticationScreen extends StatefulWidget {
  const NofiticationScreen({Key? key}) : super(key: key);

  @override
  _NofiticationScreenState createState() => _NofiticationScreenState();
}

class _NofiticationScreenState extends State<NofiticationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConstant.lightScheme.background,
        elevation: 0.0,
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
          "Notification",
          style: ThemeConstant.textTheme.headline6!.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: ThemeConstant.lightScheme.background,
      body: Center(
        child: Text(
          "Under Construction",
          style: ThemeConstant.textTheme.headline4!.copyWith(
            color: ThemeConstant.lightScheme.onBackground,
          ),
        ),
      ),
    );
  }
}
