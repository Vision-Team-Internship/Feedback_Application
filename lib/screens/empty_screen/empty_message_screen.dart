import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class EmptyMessageScreen extends StatelessWidget {
  const EmptyMessageScreen({Key? key}) : super(key: key);

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
          ),
        ),
        // ignore: prefer_const_constructors
        title: Text(
          "Message",
          // ignore: prefer_const_constructors
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
                "assets/emptys/empty_message.svg",
                width: 210,
                height: 210,
              ),
              Text(
                "No Found Message!",
                style: ThemeConstant.textTheme.headline5!.copyWith(
                  color: ThemeConstant.lightScheme.onBackground,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "You have not received any message yet.",
                textAlign: TextAlign.center,
                style: ThemeConstant.textTheme.subtitle1!.copyWith(
                  color: ThemeConstant.lightScheme.secondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
