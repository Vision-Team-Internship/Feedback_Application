// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables
import 'package:feedback_application_flutter/services/dark_mode_notification.dart';
import 'package:feedback_application_flutter/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'dart:async';

import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  var notifyHelper;
  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  @override
  void initState() {
    initPlatformState();
    notifyHelper = NotifiyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
    // notifyHelper.scheduledNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        title: Text(
          "My Profile",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: IconButton(
              onPressed: () {
                ThemeService().switchTheme();
                notifyHelper.displayNotification(
                  title: "Theme Changed",
                  body: Get.isDarkMode
                      ? "Activated Light Theme"
                      : "Activated Dark Theme",
                );
              },
              icon: Icon(
                  Get.isDarkMode
                      ? Icons.wb_sunny_outlined
                      : Icons.dark_mode_outlined,
                  size: 24,
                  color: Get.isDarkMode ? Colors.white : Colors.black),
            ),
          )
        ],
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Admin",
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
