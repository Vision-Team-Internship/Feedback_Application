// ignore_for_file: avoid_print, unused_local_variable, prefer_const_constructors
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/my_splash_screen.dart';
import 'package:feedback_application_flutter/screens/message_detail/message_detail_screen.dart';
import 'package:feedback_application_flutter/services/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
    initPlatformState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeConstant.light,
      themeMode: ThemeService().theme,
      darkTheme: ThemeConstant.dark,
      home: const MySplashScreen(),
    );
  }

  Future<void> initPlatformState() async {
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    OneSignal.shared.setAppId("711e896c-e13a-4dad-82c6-40fe033c8939");
    OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
      // print("Accepted permission: $accepted");
    });

    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {});

    OneSignal.shared.setNotificationOpenedHandler(
      (openedResult) {
        var title = openedResult.notification.title;
        var subtitle = openedResult.notification.additionalData?["feedback_id"];

        Get.to(
          () => MessageDetailScreen(
            title: title.toString(),
            date: '11/1/1',
            level: "High",
            id: subtitle.toString(),
            // ignore: prefer_const_literals_to_create_immutables
            managerContact: ["df"],
          ),
        );
      },
    );
  }
}
