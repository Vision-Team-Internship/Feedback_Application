// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

class Notification1 extends StatefulWidget {
  const Notification1({Key? key}) : super(key: key);

  @override
  _Notification1State createState() => _Notification1State();
}

class _Notification1State extends State<Notification1> {

  // @override
  // initState() {
  //   // initPlatformState();
  //   OneSignal.shared.getDeviceState().then((deviceState) {
  //     print("OneSignal: device state: ${deviceState!.jsonRepresentation()}");
  //     print("sfsdfdsfdskfdsfs ff ${deviceState.userId.toString()}");
  //   });
  //   // OneSignal.shared.setNotificationOpenedHandler((openedResult) {
  //   //   print(openedResult.)
  //   // })
  //   OneSignal.shared
  //       .setInAppMessageClickedHandler((OSInAppMessageAction action) {
  //     print('OneSignal: IAM clicked action: ${action.jsonRepresentation()}');
  //     Get.to(() => Notification1());
  //   });

  //   super.initState();
  // }

  // Future<void> initPlatformState() async {
  //   if (!mounted) return;

  //   OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  //   OneSignal.shared.setRequiresUserPrivacyConsent(_requireConsent);

  //   OneSignal.shared
  //       .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
  //     print('NOTIFICATION OPENED HANDLER CALLED WITH: ${result}');
  //     this.setState(() {
  //       _debugLabelString =
  //           "Opened notification: \n${result.notification.jsonRepresentation().replaceAll("\\n", "\n")}";
  //     });
  //   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Notification"),
        ),
      ),
    );
  }
}
