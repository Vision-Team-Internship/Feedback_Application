

import 'dart:ui';

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/screens/widgets/b_button.dart';
import 'package:flutter/material.dart';

class MessageDetailScreen extends StatefulWidget {
  const MessageDetailScreen({Key? key}) : super(key: key);

  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
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
                  "DateTime:",
                  style: ThemeConstant.textTheme.bodyText1!.copyWith(
                    color: ThemeConstant.lightScheme.secondary,
                  ),
                ),
                Text(
                  "03/12/2022",
                  style: ThemeConstant.textTheme.bodyText1!.copyWith(
                    color: Colors.black,
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
              RichText(
                text: TextSpan(
                  text: "Level: ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontFamily: "Poppins",
                  ),
                  children: [
                    TextSpan(
                      text: "HIGH",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
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
                "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: ThemeConstant.lightScheme.secondary,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  ButtonLogin(
                    title: "Approve".toUpperCase(),

                    onTap: () {},
                    borderColor: Color(0xFF0080FF),

                    onTap: () {
                      print("Approve");
                    },
                    borderColor: Color(0xFF0080FF),
                    splashIcon: Color(0xffBBDDFF),

                  ),
                  SizedBox(width: 15),
                  ButtonLogin(
                    title: "Reject".toUpperCase(),

                    onTap: () {},
                    borderColor: Color(0xffFF0000),

                  
                
                    splashIcon: Color(0xffFFC4C4),

                  ),
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
}
