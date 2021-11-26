// ignore_for_file: prefer_const_constructors, avoid_print, non_constant_identifier_names, await_only_futures, unused_local_variable, deprecated_member_use

import 'dart:convert';
import 'dart:ui';
import 'package:feedback_application_flutter/model/approved_model.dart';
import 'package:feedback_application_flutter/model/rejected_model.dart';
import 'package:feedback_application_flutter/screens/message/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  late TextEditingController _rejectNotecontroller;
  Future<DetailMessageModel>? _detailMessage;

  final MessageApi _messageApi = MessageApi();

  bool isButtonActive = true;

  @override
  void initState() {
    _detailMessage = _messageApi.readDetailMessage(widget.id.toString());
    _doneNotecontroller = TextEditingController();
    _rejectNotecontroller = TextEditingController();
    _doneNotecontroller.addListener(() {
      final isButtonActive = _doneNotecontroller.text.isNotEmpty;
      setState(() => this.isButtonActive = isButtonActive);
    });
    super.initState();
  }

  @override
  void dispose() {
    _doneNotecontroller.dispose();
    _rejectNotecontroller.dispose();
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
            // Get.to(() => MessageScreen());
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
                      ],
                    ),

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
                                          physics:
                                              NeverScrollableScrollPhysics(),
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
                                                  fontSize: 16,
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
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: detail
                                            .feedbackLocation!.room!.length,
                                        itemBuilder: (context, index) {
                                          return Row(
                                            children: [
                                              Padding(
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
                                                        .lightScheme
                                                        .onBackground,
                                                  ),
                                                ),
                                              ),
                                            ],
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
                                      physics: NeverScrollableScrollPhysics(),
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
                                      physics: NeverScrollableScrollPhysics(),
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
                                      physics: NeverScrollableScrollPhysics(),
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
                        OutlineButton(
                          onPressed: () async {
                            print("Approve");
                            openDialogApprove();
                          },
                          textColor: ThemeConstant.lightScheme.primary,
                          borderSide: BorderSide(
                            color: ThemeConstant.lightScheme.primary,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 14.0),
                            child: Text("Approve"),
                          ),
                        ),
                        const SizedBox(width: 15),
                        OutlineButton(
                          highlightedBorderColor: Colors.red,
                          onPressed: () {
                            print("Reject");
                            openDialogReject();
                          },
                          textColor: Colors.red,
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 18.0),
                            child: Text(
                              "Reject",
                              style: ThemeConstant.textTheme.button!.copyWith(
                                color: Colors.red,
                              ),
                            ),
                          ),
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
          },
        ),
      ),
    );
  }

  // Make Approve message
  Future<ApprovedModel?> makeApprove(String note, String id) async {
    http.Response response = await http.post(
      Uri.parse(
        'https://feedback-project-api.herokuapp.com/api/v1/approveds',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'note': note,
          'feedback_id': id,
        },
      ),
    );

    if (response.statusCode == 201) {
      // return ApprovedModel.fromJson(jsonDecode(response.body));
      final String data = response.body;
      return approvedModelFromJson(data);
    } else {
      return null;
    }
  }

  //Make Reject Message
  Future<RejectModel?> makeReject(String note, String id) async {
    http.Response response = await http.post(
      Uri.parse(
        'https://feedback-project-api.herokuapp.com/api/v1/rejecteds',
      ),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        {
          'note': note,
          'feedback_id': id,
        },
      ),
    );

    if (response.statusCode == 201) {
      // return ApprovedModel.fromJson(jsonDecode(response.body));
      final String data = response.body;
      return rejectModelFromJson(data);
    } else {
      return null;
    }
  }

  bool IsButtonActive = true;

  Future openDialogApprove() async {
    await Get.defaultDialog(
      title: "Note",
      content: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: TextFormField(
          controller: _doneNotecontroller,
          keyboardType: TextInputType.multiline,
          maxLines: 6,
          minLines: 1,
          autocorrect: true,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          ),
          decoration: InputDecoration(
            counterText: '',
            hintText: "Note some message",
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
            ),
          ),
        ),
      ),
      radius: 0.0,
      actions: [
        OutlineButton(
          highlightedBorderColor: ThemeConstant.lightScheme.primary,
          onPressed: isButtonActive
              ? () async {
                  final String text = _doneNotecontroller.text;
                  final ApprovedModel? _approve =
                      await makeApprove(text, widget.id);
                  setState(() {
                    _doneNotecontroller.clear();
                  });
                  // Get.to(() => MessageScreen());
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => MessageScreen()),
                      (Route<dynamic> route) => false);

                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return MessageScreen();
                  //     },
                  //   ),
                  // );
                  Get.back();
                  // Navigator.pop(context);

                  setState(() => isButtonActive = false);
                }
              : null,
          // onPressed: () async {
          //   print("Approve");
          //   final String text = _doneNotecontroller.text;
          //   final ApprovedModel? _approve = await makeApprove(text, widget.id);
          //   Get.to(() => MessageScreen());
          // },
          textColor: ThemeConstant.lightScheme.primary,
          borderSide: BorderSide(
            color: ThemeConstant.lightScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              "Yes",
              style: ThemeConstant.textTheme.button!.copyWith(
                color: ThemeConstant.lightScheme.primary,
              ),
            ),
          ),
        ),
        // ButtonLogin(
        //   title: "Yes",
        //   onTap: () async {
        //     print("Approve");
        //     final String text = _doneNotecontroller.text;
        //     // final ApprovedModel? _approve = await makeApprove(text, widget.id);
        //     // Get.to(() => MessageScreen());
        //   },
        //   borderColor: Color(0xff0080FF),
        //   splashIcon: const Color(0xffBBDDFF),
        // ),
        OutlineButton(
          highlightedBorderColor: Colors.red,
          onPressed: () {
            Get.back();
          },
          textColor: Colors.red,
          borderSide: BorderSide(
            color: Colors.red,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              "No",
              style: ThemeConstant.textTheme.button!.copyWith(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future openDialogReject() => Get.defaultDialog(
        title: "Note",
        content: TextFormField(
          controller: _rejectNotecontroller,
          keyboardType: TextInputType.multiline,
          maxLines: 6,
          minLines: 1,
          autocorrect: true,
          decoration: InputDecoration(
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
            onTap: () async {
              final RejectModel? _reject =
                  await makeReject(_rejectNotecontroller.text, widget.id);
              Get.to(() => MessageScreen());
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
