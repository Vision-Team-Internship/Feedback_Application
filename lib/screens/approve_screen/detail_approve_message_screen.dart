// ignore_for_file: prefer_const_constructors, avoid_print

import 'package:feedback_application_flutter/constants/theme_constant.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailApproveMessageScreen extends StatefulWidget {
  const DetailApproveMessageScreen({Key? key}) : super(key: key);

  @override
  _DetailApproveMessageScreenState createState() =>
      _DetailApproveMessageScreenState();
}

class _DetailApproveMessageScreenState
    extends State<DetailApproveMessageScreen> {
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
          "Not enough Water",
          style: ThemeConstant.textTheme.headline6!.copyWith(
            color: Colors.black,
          ),
        ),
        actions: [
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Completed",
                  style: ThemeConstant.textTheme.subtitle1!.copyWith(
                    color: Color(0xff00C700),
                  ),
                ),
              ],
            ),
          ),
        ],
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Floor
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          "Date completed: ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          "01/11/2022 ",
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                "Request Message:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: "Poppins",
                ),
              ),
              Text(
                "01/11/2022 ",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ThemeConstant.lightScheme.secondary,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Reqest Message

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.add, color: Colors.red),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        " Approve Message:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        "01/11/2022 ",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ThemeConstant.lightScheme.secondary,
                ),
              ),
              SizedBox(
                height: 20,
              ),

              //Reqest Message

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.add, color: Colors.red),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        " Competed Message:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        "01/11/2022 ",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ThemeConstant.lightScheme.secondary,
                ),
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
}
