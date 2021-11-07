import 'package:feedback_application_flutter/my_splash_screen.dart';
import 'package:feedback_application_flutter/screens/in_processing_screen/in_process_screen.dart';
import 'package:feedback_application_flutter/screens/login/login_screen.dart';
import 'package:feedback_application_flutter/screens/message_detail/message_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MessageDetailScreen(),
    );
  }
}
