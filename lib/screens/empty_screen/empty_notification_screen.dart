// ignore_for_file: prefer_const_constructors

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyNotificationScreen extends StatelessWidget {
  const EmptyNotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          "Notification",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/emptys/empty_notification.svg",
                width: 210,
                height: 210,
              ),
              Text(
                "No notification yet!",
                style: ThemeConstant.textTheme.headline5!.copyWith(
                  color: ThemeConstant.lightScheme.onBackground,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "You have not received any notification yet",
                textAlign: TextAlign.center,
                style: ThemeConstant.textTheme.subtitle1!.copyWith(
                  color: ThemeConstant.lightScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
