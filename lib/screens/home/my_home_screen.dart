// ignore_for_file: unused_field, prefer_const_constructors

import 'package:feedback_application_flutter/screens/approve_screen/approve_history_screen.dart';
import 'package:feedback_application_flutter/screens/home/chart_flutter.dart';
import 'package:feedback_application_flutter/screens/in_processing_screen/in_process_screen.dart';
import 'package:feedback_application_flutter/screens/message/message_screen.dart';
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

  @override
  void initState() {
    super.initState();
    _chartData = getChartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  onTap: () {
                    // ignore: avoid_print
                    print("Notification");
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
                  Get.to(MessageScreen());
                },
                subtitle: 'Recieved: 9+',
                title: 'Message',
                svgIcon: 'assets/icons/chat_icons.svg',
              ),
              FListTile(
                onTap: () {
                  // ignore: avoid_print
                  print("In process");
                  Get.to(InProcessingScreen());
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
                  print("See more");
                },
                subtitle: 'Body sensors, Calendar and more in settings',
                title: 'See other permissions',
                svgIcon: 'assets/icons/arrow_down_icons.svg',
              ),

              FListTile(
                onTap: () {
                  // ignore: avoid_print
                  print("Setting");
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
    );
  }

  List<CounterData> getChartData() {
    final List<CounterData> chartData = [
      CounterData(title: "Water", count: 10),
      CounterData(title: "Sport", count: 8),
      CounterData(title: "Technical", count: 1),
      CounterData(title: "Electricity", count: 4),
      CounterData(title: "Internet", count: 2),
      CounterData(title: "Hot", count: 7),
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
