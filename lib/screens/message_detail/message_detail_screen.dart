// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, prefer_const_declarations, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/getdata/message_api.dart';
import 'package:feedback_application_flutter/model/detail_message_model.dart';
import 'package:feedback_application_flutter/screens/widgets/b_button.dart';

class MessageDetailScreen extends StatefulWidget {
  final String title;
  final String date;
  final String level;
  final String id;
  final List managerContact;

  const MessageDetailScreen({
    Key? key,
    required this.title,
    required this.date,
    required this.level,
    required this.id,
    required this.managerContact,
  }) : super(key: key);

  @override
  _MessageDetailScreenState createState() => _MessageDetailScreenState();
}

class _MessageDetailScreenState extends State<MessageDetailScreen> {
  late TextEditingController _doneNotecontroller;
  Future<DetailMessageModel>? _detailMessage;

  final MessageApi _messageApi = MessageApi();

  @override
  void initState() {
    _detailMessage = _messageApi.readDetailMessage(widget.id.toString());
    _doneNotecontroller = TextEditingController();
    _doneNotecontroller.addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _doneNotecontroller.dispose();
    super.dispose();
  }

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
        actions: [
          SizedBox(
            width: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "DateTime:",
                  style: ThemeConstant.textTheme.bodyText2!.copyWith(
                    color: ThemeConstant.lightScheme.secondary,
                  ),
                ),
                Text(
                  widget.date,
                  style: ThemeConstant.textTheme.bodyText2!.copyWith(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: FutureBuilder<DetailMessageModel>(
          future: _detailMessage,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Error While read Detail Message"),
              );
            }

            if (snapshot.hasData) {
              var detail = snapshot.data!.payload;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            "Level: ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            widget.level,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: widget.level.toUpperCase() ==
                                      "high".toUpperCase()
                                  ? Colors.red
                                  : widget.level.toUpperCase() ==
                                          "medium".toUpperCase()
                                      ? Color(0xffCACA03)
                                      : Color(0xff00C700),
                              fontFamily: "Poppins",
                            ),
                          ),
                        ]),

                    const SizedBox(
                      height: 20,
                    ),

                    Text(
                      "Location: ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //Location
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Floor
                          Row(
                            children: [
                              Text(
                                "+ Floor: ",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeConstant.lightScheme.secondary,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Wrap(
                                children: List.generate(
                                  detail!.feedbackLocation!.floor!.length,
                                  (index) => Column(
                                    children: [
                                      Text(
                                        detail.feedbackLocation!.floor![index],
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeConstant
                                              .lightScheme.onBackground,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Department
                          SizedBox(
                            height: 10,
                          ),
                          detail.feedbackLocation!.department!.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "+ Department :",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            ThemeConstant.lightScheme.secondary,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: detail.feedbackLocation!
                                              .department!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Text(
                                                detail.feedbackLocation!
                                                    .department![index],
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w400,
                                                  color: ThemeConstant
                                                      .lightScheme.onBackground,
                                                ),
                                              ),
                                            );
                                          }),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          detail.feedbackLocation!.room!.isNotEmpty
                              ?
                              // Room
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "+ Room :",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            ThemeConstant.lightScheme.secondary,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: detail
                                            .feedbackLocation!.room!.length,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 18.0),
                                            child: Text(
                                              detail.feedbackLocation!
                                                  .room![index],
                                              style: TextStyle(
                                                fontFamily: "Poppins",
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color: ThemeConstant
                                                    .lightScheme.onBackground,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Manager Contact:",
                      style: TextStyle(
                        fontSize: 16,
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Card ID
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card ID : ",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeConstant.lightScheme.secondary,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: detail.managerContact!.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          detail.managerContact![index].cardId
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ThemeConstant
                                                .lightScheme.onBackground,
                                          ),
                                        );
                                      }),
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
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeConstant.lightScheme.secondary,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: detail.managerContact!.length,
                                      itemBuilder: (context, index) {
                                        return Text(
                                          detail.managerContact![index].username
                                              .toString(),
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: ThemeConstant
                                                .lightScheme.onBackground,
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),

                            //Room
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone : ",
                                  style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeConstant.lightScheme.secondary,
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: detail.managerContact!.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () async {
                                            final phonenumber = detail
                                                .managerContact![index]
                                                .phoneNumber;
                                            final url = 'tel:0$phonenumber';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            }
                                          },
                                          child: Text(
                                            "0${detail.managerContact![index].phoneNumber}",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontFamily: "Poppins",
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeConstant
                                                  .lightScheme.primary,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Message :",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      detail.message.toString(),
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
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
                          title: "Approve".toUpperCase(),
                          onTap: () {
                            print("Approve");
                            openDialogApprove();
                          },
                          borderColor: const Color(0xFF0080FF),
                          splashIcon: const Color(0xffBBDDFF),
                        ),
                        const SizedBox(width: 15),
                        ButtonLogin(
                          title: "Reject".toUpperCase(),
                          onTap: () {
                            print("Reject");
                            openDialogReject();
                          },
                          borderColor: const Color(0xffFF0000),
                          splashIcon: const Color(0xffFFC4C4),
                        ),
                      ],
                    ),

                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();

            // return Container(
            //   padding: const EdgeInsets.symmetric(horizontal: 25),
            //   width: MediaQuery.of(context).size.width,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       const SizedBox(
            //         height: 45,
            //       ),
            //       RichText(
            //         text: TextSpan(
            //           text: "Level: ",
            //           style: TextStyle(
            //             fontSize: 18,
            //             fontWeight: FontWeight.w500,
            //             color: Colors.black,
            //             fontFamily: "Poppins",
            //           ),
            //           // ignore: prefer_const_literals_to_create_immutables
            //           children: [
            //             TextSpan(
            //               text: widget.level,
            //               style: const TextStyle(
            //                 fontSize: 18,
            //                 fontWeight: FontWeight.w500,
            //                 color: Colors.red,
            //                 fontFamily: "Poppins",
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         widget.id.toString(),
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black,
            //           fontFamily: "Poppins",
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),

            //       //Building
            //       Container(
            //         padding: EdgeInsets.symmetric(horizontal: 3),
            //         width: MediaQuery.of(context).size.width,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             //Floor
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Floor: ",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.secondary,
            //                   ),
            //                 ),
            //                 Text(
            //                   "F1,F2 ",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //               ],
            //             ),

            //             //Department
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Department: ",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.secondary,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Developer",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //               ],
            //             ),

            //             //Room
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Room: ",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.secondary,
            //                   ),
            //                 ),
            //                 Text(
            //                   "201",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),

            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         "Manager Contact:",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black,
            //           fontFamily: "Poppins",
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),

            //       //Manager Contact
            //       Container(
            //         padding: EdgeInsets.symmetric(horizontal: 3),
            //         width: MediaQuery.of(context).size.width,
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             //Floor
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Card ID : ",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.secondary,
            //                   ),
            //                 ),
            //                 Text(
            //                   "B20120..",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //                 Text(
            //                   "B20120..",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //                 Text(
            //                   "B20120..",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //               ],
            //             ),

            //             //Department
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Name: ",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.secondary,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Dara",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Dara",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //                 Text(
            //                   "Dara",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //               ],
            //             ),

            //             //Room
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 Text(
            //                   "Phone: ",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.secondary,
            //                   ),
            //                 ),
            //                 Text(
            //                   "047474747",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //                 Text(
            //                   "047474747",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //                 Text(
            //                   "047474747",
            //                   style: TextStyle(
            //                     fontFamily: "Poppins",
            //                     fontSize: 18,
            //                     fontWeight: FontWeight.w400,
            //                     color: ThemeConstant.lightScheme.onBackground,
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         "Message :",
            //         style: TextStyle(
            //           fontSize: 18,
            //           fontWeight: FontWeight.w500,
            //           color: Colors.black,
            //           fontFamily: "Poppins",
            //         ),
            //       ),
            //       SizedBox(
            //         height: 20,
            //       ),
            //       Text(
            //         "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.",
            //         style: TextStyle(
            //           fontFamily: "Poppins",
            //           fontSize: 18,
            //           fontWeight: FontWeight.w400,
            //           color: ThemeConstant.lightScheme.secondary,
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 40,
            //       ),

            //       Row(
            //         children: [
            //           ButtonLogin(
            //             title: "Approve".toUpperCase(),
            //             onTap: () {
            //               print("Approve");
            //               openDialogApprove();
            //             },
            //             borderColor: const Color(0xFF0080FF),
            //             splashIcon: const Color(0xffBBDDFF),
            //           ),
            //           const SizedBox(width: 15),
            //           ButtonLogin(
            //             title: "Reject".toUpperCase(),
            //             onTap: () {
            //               print("Reject");
            //               openDialogReject();
            //             },
            //             borderColor: const Color(0xffFF0000),
            //             splashIcon: const Color(0xffFFC4C4),
            //           ),
            //         ],
            //       ),

            //       SizedBox(
            //         height: 50,
            //       ),
            //     ],
            //   ),
            // );
          },
        ),
      ),
    );
  }

  bool IsButtonActive = true;

  Future openDialogApprove() => Get.defaultDialog(
        title: "Note",
        content: TextFormField(
          controller: _doneNotecontroller,
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
