// ignore_for_file: unused_field, prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, unused_local_variable

import 'package:feedback_application_flutter/screens/admin_account/admin_account.dart';
import 'package:feedback_application_flutter/screens/history/approve_history_screen.dart';
import 'package:feedback_application_flutter/screens/home/chart_flutter.dart';
import 'package:feedback_application_flutter/screens/in_processing_screen/in_process_screen.dart';
import 'package:feedback_application_flutter/screens/message/message_screen.dart';
import 'package:feedback_application_flutter/screens/notification_screen/nofitication_screen.dart';
import 'package:feedback_application_flutter/screens/notification_screen/notification_screen1.dart';
import 'package:feedback_application_flutter/screens/setting/setting_screen.dart';
import 'package:feedback_application_flutter/screens/widgets/f_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CounterData>? _chartData;
  DateTime? lastPressed;
  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();
        final maxDuration = Duration(seconds: 2);
        final isWarning =
            lastPressed == null || now.difference(lastPressed!) > maxDuration;

        if (isWarning) {
          lastPressed = DateTime.now();
          final snackBar = SnackBar(
            content: Text("Double Tap To Close App"),
            duration: maxDuration,
          );
          ScaffoldMessenger.of(context)
            ..removeCurrentSnackBar()
            ..showSnackBar(snackBar);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFFFFFF),
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: RichText(
              text: TextSpan(
                text: "Privacy ",
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Dashboard",
                    style: TextStyle(
                      color: ThemeConstant.lightScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                children: [
                  InkWell(
                    onTap: () async {
                      // ignore: avoid_print
                      print("Notification");
                      // SharedPreferences pref =
                      //     await SharedPreferences.getInstance();
                      // pref.remove("login");
                      // pref.commit();
                      Get.to(() => Notification1(
                            title: "",
                          ));
                    },
                    child: SvgPicture.asset(
                      "assets/icons/notification_icons.svg",
                      width: 26,
                      cacheColorFilter: true,
                      height: 26,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 30,
                ),

                //  Chart Customize
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFBFAFA),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(2, 2),
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 4,
                      ),
                      BoxShadow(
                        offset: const Offset(-1, -1),
                        color: Colors.black.withOpacity(.25),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const ChartFlutter(),
                ),
                const SizedBox(height: 50),
                FListTile(
                  onTap: () {
                    // ignore: avoid_print
                    print("Message");
                    Get.to(() => MessageScreen());
                  },
                  subtitle: 'Recieved: 9+',
                  title: 'Message',
                  svgIcon: 'assets/icons/chat_icons.svg',
                ),
                FListTile(
                  onTap: () {
                    // ignore: avoid_print
                    print("In process");
                    Get.to(() => InProcessingScreen());
                  },
                  subtitle: 'Recieved: 9+',
                  title: 'In Processing',
                  svgIcon: 'assets/icons/inprocess_icons.svg',
                ),
                FListTile(
                  onTap: () {
                    // ignore: avoid_print
                    print("History");
                    Get.to(() => ApproveHistoryScreen());
                  },
                  subtitle: 'Recieved: 9+',
                  title: 'History',
                  svgIcon: 'assets/icons/history_icons.svg',
                ),
                FListTile(
                  onTap: () {
                    // ignore: avoid_print
                    print("Account");
                    Get.to(() => AdminAccontScreen());
                  },
                  subtitle: 'Edit account ,Logout',
                  title: 'Account',
                  svgIcon: 'assets/icons/account.svg',
                ),
                FListTile(
                  onTap: () {
                    // ignore: avoid_print
                    Get.to(() => SettingScreen());
                  },
                  subtitle: 'Manage app Account, themes, permissions, etc..',
                  title: 'Settings',
                  svgIcon: 'assets/icons/setting_icons.svg',
                ),

                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<CounterData> getChartData() {
    final List<CounterData> chartData = [
      CounterData(title: "High", count: 10),
      CounterData(title: "Meduim", count: 8),
      CounterData(title: "Low", count: 8),
    ];

    return chartData;
  }
}

class CounterData {
  final String title;
  final int count;
  CounterData({
    required this.title,
    required this.count,
  });
}
