// ignore_for_file: unused_field, prefer_const_constructors, non_constant_identifier_names, deprecated_member_use, unused_local_variable, avoid_print, prefer_const_literals_to_create_immutables

import 'package:feedback_application_flutter/data/archived_api/archived_message_api.dart';
import 'package:feedback_application_flutter/data/getdata/home_api.dart';
import 'package:feedback_application_flutter/data/notification/notification_api.dart';
import 'package:feedback_application_flutter/model/archived_message_model.dart';
import 'package:feedback_application_flutter/model/count_inprocessing_model.dart';
import 'package:feedback_application_flutter/model/home_model.dart';
import 'package:feedback_application_flutter/model/notification_model.dart';
import 'package:feedback_application_flutter/screens/admin_account/admin_account.dart';
import 'package:feedback_application_flutter/screens/archived_screen/archived_message.dart';
import 'package:feedback_application_flutter/screens/history/approve_history_screen.dart';
import 'package:feedback_application_flutter/screens/home/chart_flutter.dart';
import 'package:feedback_application_flutter/screens/in_processing_screen/in_process_screen.dart';
import 'package:feedback_application_flutter/screens/message/message_screen.dart';
import 'package:feedback_application_flutter/screens/notification_screen/notification_screen.dart';
import 'package:feedback_application_flutter/screens/setting/setting_screen.dart';
import 'package:feedback_application_flutter/screens/widgets/f_listtile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<HomeModel>? _homemodel;
  Future<CountInprocessingModel>? _countInprocess;
  Future<NotificationModel>? _countNotification;
  Future<ArchivedMessageModel>? _countArchived;
  final NotificationApi _notificationApi = NotificationApi();
  final HomeApi _api = HomeApi();
  final ArchivedMessageApi _archivedMessageApi = ArchivedMessageApi();
  List<CounterData>? _chartData;
  DateTime? lastPressed;

  @override
  void initState() {
    super.initState();
    _countArchived = _archivedMessageApi.readArchived();
    _homemodel = _api.readCountMessage('?isApproved=false&isRejected=false');
    _countInprocess =
        _api.readCountInprocessing('?isApproved=true&isCompleted=false');
    _countNotification = _notificationApi.readDataFromNotification();
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
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: RichText(
              text: TextSpan(
                text: "Privacy ",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                ),
                children: [
                  TextSpan(
                    text: "Dashboard",
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => NotificationScreen())?.then((value) {
                  print("Notification: $value");
                  setState(() {
                    _homemodel = _api
                        .readCountMessage('?isApproved=false&isRejected=false');
                    _countInprocess = _api.readCountInprocessing(
                        '?isApproved=true&isCompleted=false');
                    _countNotification =
                        _notificationApi.readDataFromNotification();
                  });
                });
              },
              child: CountNotification(),
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
              children: [
                const SizedBox(
                  height: 30,
                ),

                //  Chart Customize
                Container(
                  width: MediaQuery.of(context).size.width - 80,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.white,
                    ),
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

                //Count Message
                FutureBuilder<HomeModel>(
                  future: _homemodel,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (snapshot.hasData) {
                      var counter = snapshot.data!.payload;
                      print("Message Request= ${counter?.length}");
                      return FListTile(
                        onTap: () {
                          print("Message");
                          Get.to(() => MessageScreen())!.then(
                            (value) {
                              _homemodel = _api.readCountMessage(
                                '?isApproved=false&isRejected=false',
                              );
                              _countInprocess = _api.readCountInprocessing(
                                '?isApproved=true&isCompleted=false',
                              );
                            },
                          );
                        },
                        subtitle: "Received: ${counter!.length.toString()}",
                        title: 'Message',
                        svgIcon: 'assets/icons/chat_icons.svg',
                      );
                    }
                    return FListTile(
                      onTap: () {
                        print("Message");
                        Get.to(() => MessageScreen());
                      },
                      subtitle: 'Recieved: 0',
                      title: 'Message',
                      svgIcon: 'assets/icons/chat_icons.svg',
                    );
                  },
                ),

                //Count Inprocess Message
                FutureBuilder<CountInprocessingModel>(
                  future: _countInprocess,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error"),
                      );
                    }
                    if (snapshot.hasData) {
                      var inprocessing = snapshot.data!;
                      print("inprocessing message = ${inprocessing.count}");
                      return FListTile(
                        onTap: () {
                          print("In process");
                          Get.to(() => InProcessingScreen())!.then(
                            (value) {
                              _homemodel = _api.readCountMessage(
                                  '?isApproved=false&isRejected=false');
                              _countInprocess = _api.readCountInprocessing(
                                  '?isApproved=true&isCompleted=false');
                            },
                          );
                        },
                        subtitle: "Received: ${inprocessing.count.toString()}",
                        title: 'In Processing',
                        svgIcon: 'assets/icons/inprocess_icons.svg',
                      );
                    }
                    return FListTile(
                      onTap: () {
                        print("In process Message");
                        Get.to(() => InProcessingScreen());
                      },
                      subtitle: 'Recieved: 0',
                      title: 'In Processing',
                      svgIcon: 'assets/icons/inprocess_icons.svg',
                    );
                  },
                ),

                FutureBuilder<ArchivedMessageModel>(
                  future: _countArchived,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error ${snapshot.error}"),
                      );
                    }

                    if (snapshot.hasData) {
                      var countArchived = snapshot.data?.count;
                      print("Archived Message $countArchived");
                      return FListTile(
                        onTap: () {
                          print("Archive");
                          Get.to(
                            () => ArchivedMessage(),
                          )!
                              .then(
                            (value) {
                              _homemodel = _api.readCountMessage(
                                  '?isApproved=false&isRejected=false');
                              _countInprocess = _api.readCountInprocessing(
                                  '?isApproved=true&isCompleted=false');
                            },
                          );
                        },
                        subtitle: 'Received: $countArchived',
                        title: 'Archive Message',
                        svgIcon: 'assets/icons/archive.svg',
                      );
                    }
                    return FListTile(
                      onTap: () {
                        print("Archive");
                        Get.to(
                          () => ArchivedMessage(),
                        )!
                            .then(
                          (value) {
                            _homemodel = _api.readCountMessage(
                                '?isApproved=false&isRejected=false');
                            _countInprocess = _api.readCountInprocessing(
                                '?isApproved=true&isCompleted=false');
                          },
                        );
                      },
                      subtitle: 'Received: 0',
                      title: 'Archive Message',
                      svgIcon: 'assets/icons/archive.svg',
                    );
                  },
                ),
                FListTile(
                  onTap: () {
                    print("History");
                    Get.to(
                      () => ApproveHistoryScreen(),
                    )!
                        .then(
                      (value) {
                        _homemodel = _api.readCountMessage(
                            '?isApproved=false&isRejected=false');
                        _countInprocess = _api.readCountInprocessing(
                            '?isApproved=true&isCompleted=false');
                      },
                    );
                  },
                  subtitle: 'Done, Reject',
                  title: 'History Message',
                  svgIcon: 'assets/icons/history_icons.svg',
                ),

                FListTile(
                  onTap: () {
                    print("Account");
                    Get.to(() => AdminAccontScreen())!.then(
                      (value) {
                        _homemodel = _api.readCountMessage(
                            '?isApproved=false&isRejected=false');
                        _countInprocess = _api.readCountInprocessing(
                            '?isApproved=true&isCompleted=false');
                      },
                    );
                  },
                  subtitle: 'Edit account ,Logout',
                  title: 'Account',
                  svgIcon: 'assets/icons/account.svg',
                ),

                FListTile(
                  onTap: () {
                    Get.to(() => SettingScreen())!.then(
                      (value) {
                        _homemodel = _api.readCountMessage(
                            '?isApproved=false&isRejected=false');
                        _countInprocess = _api.readCountInprocessing(
                            '?isApproved=true&isCompleted=false');
                      },
                    );
                  },
                  subtitle: 'Manage app Account, themes, permissions, etc..',
                  title: 'Profile & Settings',
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

  Widget CountNotification() {
    return FutureBuilder<NotificationModel>(
      future: _countNotification,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error ${snapshot.error}",
            ),
          );
        }

        if (snapshot.hasData) {
          String unRead = snapshot.data!.unRead.toString();
          print(unRead);
          return Container(
            alignment: Alignment.center,
            // padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
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
                    width: 15,
                    height: 15,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      unRead,
                      style: TextStyle(
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return Container(
          alignment: Alignment.center,
          // padding: const EdgeInsets.symmetric(horizontal: 30),
          margin: const EdgeInsets.only(right: 10),
          child: Stack(
            children: [
              InkWell(
                onTap: () async {
                  print("Notification");

                  Get.to(
                    () => NotificationScreen(),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2),
                  child: SvgPicture.asset(
                    "assets/icons/notification_icons.svg",
                    width: 26,
                    cacheColorFilter: true,
                    height: 26,
                  ),
                ),
              ),
              Positioned(
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text("0"),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<CounterData> getChartData() {
    final List<CounterData> chartData = [
      CounterData(title: "High", count: 10),
      CounterData(title: "Meduim", count: 8),
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
