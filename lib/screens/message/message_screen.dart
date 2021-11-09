// ignore_for_file: prefer_const_constructors

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/message/widgets/f_tile.dart';
import 'package:feedback_application_flutter/screens/message_detail/message_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 24,
          ),
        ),

        title: Text(
          "Message",
          style: const TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff000000),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(horizontal: 25),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              SvgPicture.asset(
                "assets/icon_background/message_icon.svg",
              ),
              const SizedBox(height: 23),
              const Text(
                "Message Feedback",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: Colors.black,
                ),
              ),
              Text(
                "Timeline of when recieved request",
                style: ThemeConstant.textTheme.bodyText2!.copyWith(
                  color: ThemeConstant.lightScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              FTile(
                onTap: () {
                  Get.to(MessageDetailScreen());
                },
                title: 'Not enough Water',
                floor: 'F1>IT>Room102',
                level: 'High',
                date: '02/11/2022',
                levelColor: Colors.red,
              ),
              const FTile(
                title: 'Not enough Water',
                floor: 'F1>IT>Room102',
                level: 'Medium',
                date: '02/11/2022',
                levelColor: Color(0xffDEDE22),
              ),
              const FTile(
                title: 'Not enough Water',
                floor: 'F1>IT>Room102',
                level: 'Low',
                date: '02/11/2022',
                levelColor: Color(0xff00C700),
              ),
              const FTile(
                title: 'Not enough Water',
                floor: 'F1>IT>Room102',
                level: 'High',
                date: '02/11/2022',
                levelColor: Colors.red,
              ),
              const FTile(
                title: 'Not enough Water',
                floor: 'F1>IT>Room102',
                level: 'Medium',
                date: '02/11/2022',
                levelColor: Color(0xffDEDE22),
              ),
              const FTile(
                title: 'Not enough Water',
                floor: 'F1>IT>Room102',
                level: 'Low',
                date: '02/11/2022',
                levelColor: Color(0xff00C700),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
