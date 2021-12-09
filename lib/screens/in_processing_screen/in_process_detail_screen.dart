// ignore_for_file: prefer_const_constructors, avoid_print, camel_case_types, prefer_const_literals_to_create_immutables

import 'dart:convert';
import 'package:feedback_application_flutter/model/approved_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/getdata/message_api.dart';
import 'package:feedback_application_flutter/model/completed_model.dart';
import 'package:feedback_application_flutter/model/detail_message_model.dart';
import 'package:feedback_application_flutter/screens/in_processing_screen/in_process_screen.dart';
import 'package:feedback_application_flutter/screens/widgets/b_button.dart';

class DetailMessageInProcess extends StatefulWidget {
  final String title;
  final String dateTime;
  final String message;
  final String id;
  final String level;

  const DetailMessageInProcess({
    Key? key,
    required this.title,
    required this.dateTime,
    required this.message,
    required this.id,
    required this.level,
  }) : super(key: key);

  @override
  _DetailMessageInProcessState createState() => _DetailMessageInProcessState();
}

class _DetailMessageInProcessState extends State<DetailMessageInProcess> {
  late TextEditingController _comController;
  Future<DetailMessageModel>? _detailMessage;
  Future<ApprovedModel>? _approveDate;

  final MessageApi _messageApi = MessageApi();

  @override
  void initState() {
    _comController = TextEditingController();
    _detailMessage = _messageApi.readDetailMessage(widget.id);
    _approveDate = _messageApi.readDetailApprove(widget.id);
    print(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    _comController.dispose();
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
            Get.to(() => InProcessingScreen());
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Poppins",
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                        height: 25,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Approve Date : ",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          _dateApproved(approveDate: _approveDate),
                        ],
                      ),
                      SizedBox(
                        height: 20,
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
                                          detail
                                              .feedbackLocation!.floor![index],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "+ Department :",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeConstant
                                              .lightScheme.secondary,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
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
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w400,
                                                    color: ThemeConstant
                                                        .lightScheme
                                                        .onBackground,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "+ Room :",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeConstant
                                              .lightScheme.secondary,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: ListView.builder(
                                          physics:
                                              NeverScrollableScrollPhysics(),
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
                                      color:
                                          ThemeConstant.lightScheme.secondary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            detail.managerContact!.length,
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
                                      color:
                                          ThemeConstant.lightScheme.secondary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            detail.managerContact!.length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                            detail
                                                .managerContact![index].username
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
                                      color:
                                          ThemeConstant.lightScheme.secondary,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            detail.managerContact!.length,
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
                        "Feedback Message :",
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
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            "+ ",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.red,
                              fontFamily: "Poppins",
                            ),
                          ),
                          Text(
                            "Approve Message :",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ApproveMess(approveNote: _approveDate),

                      const SizedBox(
                        height: 40,
                      ),

                      Row(
                        children: [
                          ButtonLogin(
                            title: "done".toUpperCase(),
                            onTap: () {
                              print("Done");
                              openDialogApprove();
                            },
                            borderColor: const Color(0xFF0080FF),
                            splashIcon: const Color(0xffBBDDFF),
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
              return SizedBox();
            }),
      ),
    );
  }

  //Make Completed Message
  Future<CompletedModel?> makeCompleted(String note, String id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString('login');
    http.Response response = await http.post(
      Uri.parse('https://feedback-project-api.herokuapp.com/api/v1/completeds'),
      headers: {
        "auth-token": '$token',
        "Content-Type": "application/json",
      },
      body: jsonEncode(
        {
          'note': note,
          'feedback_id': id,
        },
      ),
    );
    if (response.statusCode == 201) {
      final String data = response.body;
      return completedModelFromJson(data);
    } else {
      return null;
    }
  }

  Future openDialogApprove() => Get.defaultDialog(
        title: "Note",
        content: TextFormField(
          controller: _comController,
          minLines: 1,
          keyboardType: TextInputType.multiline,
          autocorrect: true,
          maxLines: 6,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: "Poppins",
          ),
          decoration: InputDecoration(
            hintText: "Note some message",
            hintStyle: TextStyle(
              fontSize: 16,
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
              final CompletedModel? _completedMessage = await makeCompleted(
                _comController.text,
                widget.id.toString(),
              );
              setState(() {
                _completedMessage;
              });
              Get.to(() => InProcessingScreen());
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
}

class ApproveMess extends StatelessWidget {
  const ApproveMess({
    Key? key,
    required Future<ApprovedModel>? approveNote,
  })  : _approveNote = approveNote,
        super(key: key);

  final Future<ApprovedModel>? _approveNote;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApprovedModel>(
      future: _approveNote,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error ${snapshot.error}"),
          );
        }
        if (snapshot.hasData) {
          var note = snapshot.data!.payload;
          return Wrap(
            children: List.generate(
              note!.length,
              (index) => Text(
                "${note[index].note}",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeConstant.lightScheme.secondary,
                ),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}

class _dateApproved extends StatelessWidget {
  const _dateApproved({
    Key? key,
    required Future<ApprovedModel>? approveDate,
  })  : _approveDate = approveDate,
        super(key: key);

  final Future<ApprovedModel>? _approveDate;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApprovedModel>(
      future: _approveDate,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text("Error ${snapshot.error}"),
          );
        }
        if (snapshot.hasData) {
          var date = snapshot.data!.payload;
          return Wrap(
            children: List.generate(
              date!.length,
              (index) => Text(
                "${date[index].createdDate!.day}/${date[index].createdDate!.month}/${date[index].createdDate!.year}",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.red),
              ),
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
