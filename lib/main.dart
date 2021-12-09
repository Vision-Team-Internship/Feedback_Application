// ignore_for_file: avoid_print

import 'package:feedback_application_flutter/my_splash_screen.dart';
import 'package:feedback_application_flutter/screens/notification_screen/notification_screen1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    // //Remove this method to stop OneSignal Debugging
    // OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    // OneSignal.shared.setAppId("711e896c-e13a-4dad-82c6-40fe033c8939");

    // // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    // OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    //   print("Accepted permission: $accepted");
    // });

    // OneSignal.shared
    //     .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});

    // OneSignal.shared.setNotificationOpenedHandler((openedResult) {
    //   var data = openedResult.notification.title;
    //   Get.to(() => Notification1());
    // });

    initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySplashScreen(),
    );
  }

  Future<void> initPlatformState() async {
    //Remove this method to stop OneSignal Debugging
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

    OneSignal.shared.setAppId("711e896c-e13a-4dad-82c6-40fe033c8939");
    // The promptForPushNotificationsWithUserResponse function will show the iOS push notification prompt. We recommend removing the following code and instead using an In-App Message to prompt for notification permission
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      print("Accepted permission: $accepted");
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});

    OneSignal.shared.setNotificationOpenedHandler((openedResult) {
      var data = openedResult.notification.title;
      Get.to(() => Notification1());
    });
  }
}
