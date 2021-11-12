// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/widgets/b_button.dart';

class DetailMessageInProcess extends StatefulWidget {
  final String title;
  final String dateTime;
  final String message;
  const DetailMessageInProcess({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.message,
  }) : super(key: key);

  @override
  _DetailMessageInProcessState createState() => _DetailMessageInProcessState();
}

class _DetailMessageInProcessState extends State<DetailMessageInProcess> {
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
        title: Text(
          widget.title,
          style: ThemeConstant.textTheme.headline6!.copyWith(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 45,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Approve Date:",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Text(
                    widget.dateTime,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: ThemeConstant.lightScheme.onBackground,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              RichText(
                text: TextSpan(
                  text: "Level: ",

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextSpan(
                      text: "HIGH",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Building:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Building
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Floor
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Floor: ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.secondary,
                          ),
                        ),
                        Text(
                          "F1,F2 ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    //Department
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Department: ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.secondary,
                          ),
                        ),
                        Text(
                          "Developer",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    //Room
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Room: ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.secondary,
                          ),
                        ),
                        Text(
                          "201",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "Manager Contact:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Manager Contact
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Floor
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Card ID : ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.secondary,
                          ),
                        ),
                        Text(
                          "B20120..",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                        Text(
                          "B20120..",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                        Text(
                          "B20120..",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    //Department
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name: ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.secondary,
                          ),
                        ),
                        Text(
                          "Dara",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                        Text(
                          "Dara",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                        Text(
                          "Dara",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                      ],
                    ),

                    //Room
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone: ",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.secondary,
                          ),
                        ),
                        Text(
                          "047474747",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                        Text(
                          "047474747",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                        Text(
                          "047474747",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: ThemeConstant.lightScheme.onBackground,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Message :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.message,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ThemeConstant.lightScheme.secondary,
                ),
              ),
              const SizedBox(
                height: 40,
              ),

              Row(
                children: [
                  ButtonLogin(
                    title: "done".toUpperCase(),
                    onTap: () {
                      print("Approve");
                      openDialogApprove();
                    },
                    borderColor: const Color(0xFF0080FF),
                    splashIcon: const Color(0xffBBDDFF),
                  ),
                  const SizedBox(width: 15),
                ],
              ),

              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openDialogApprove() => Get.defaultDialog(
        title: "Note",
        content: TextFormField(
          minLines: 2,
          maxLines: 5,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
            hintText: "Note some message",
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
        ),
        radius: 0.0,
        actions: [
          ButtonLogin(
            title: "Yes",
            onTap: () {
              print("Approve");
            },
            borderColor: Color(0xff0080FF),
            splashIcon: const Color(0xffBBDDFF),
          ),
          ButtonLogin(
            title: "No",
            onTap: () {
              Get.back();
            },
            borderColor: Color(0xffFF0000),
            splashIcon: const Color(0xffFFC4C4),
          ),
        ],
      );

  Future openDialogReject() => Get.defaultDialog(
        title: "Note",
        content: TextFormField(
          minLines: 2,
          maxLines: 5,
          decoration: InputDecoration(
            labelStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
            hintText: "Note some reasone",
            hintStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
        ),
        radius: 0.0,
        actions: [
          ButtonLogin(
            title: "Yes",
            onTap: () {
              print("Reject");
            },
            borderColor: Color(0xff0080FF),
            splashIcon: const Color(0xffBBDDFF),
          ),
          ButtonLogin(
            title: "No",
            onTap: () {
              Get.back();
            },
            borderColor: Color(0xffFF0000),
            splashIcon: const Color(0xffFFC4C4),
          ),
        ],
      );
}
