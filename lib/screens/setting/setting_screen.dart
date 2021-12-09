// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:app_settings/app_settings.dart';
import 'dart:async';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Future<void> initPlatformState() async {
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
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
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                AppSettings.openDeviceSettings(
                  asAnotherTask: true,
                );
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
