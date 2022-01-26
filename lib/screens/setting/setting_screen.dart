// ignore_for_file: prefer_const_constructors
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
  Future<void> initPlatformState() async {
    if (!mounted) return;
  }

  @override
  void initState() {
    initPlatformState();
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
            )),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                ThemeService().switchTheme();
              },
              child: Text("Nofiticatoin"),
            ),
            ElevatedButton(
              onPressed: () {
                AppSettings.openSoundSettings();
              },
              child: Text("Nofiticatoin"),
            ),
          ],
        ),
      ),
    );
  }
}
