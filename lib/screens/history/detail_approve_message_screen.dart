// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:feedback_application_flutter/model/approved_model.dart';
import 'package:feedback_application_flutter/model/completed_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/getdata/message_api.dart';
import 'package:feedback_application_flutter/model/detail_message_model.dart';

class DetailApproveMessageScreen extends StatefulWidget {
  final String title;
  final String date;
  final String level;
  final String id;
  final List managerContact; 

  const DetailApproveMessageScreen({
    Key? key,
    required this.title,
    required this.date,
    required this.level,
    required this.id,
    required this.managerContact,
  }) : super(key: key);

  @override
  _DetailApproveMessageScreenState createState() =>
      _DetailApproveMessageScreenState();
}

class _DetailApproveMessageScreenState
    extends State<DetailApproveMessageScreen> {
  Future<DetailMessageModel>? _detailMessage;
  Future<ApprovedModel>? _approve;
  Future<CompletedModel>? _completedMessage;

  final MessageApi _messageApi = MessageApi();

  @override
  void initState() {
    _detailMessage = _messageApi.readDetailMessage(widget.id.toString());
    _approve = _messageApi.readDetailApprove(widget.id);
    _completedMessage = _messageApi.completedHistory(widget.id);
    super.initState();
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
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Poppins",
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
                      height: 25,
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
                                        physics: NeverScrollableScrollPhysics(),
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
                                      physics: NeverScrollableScrollPhysics(),
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
                                    physics: NeverScrollableScrollPhysics(),
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
                                    },
                                  ),
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

                    Column(
                      // ignore: prefer_const_literals_to_create_immutables
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Request Message :",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontFamily: "Poppins",
                          ),
                        ),
                        Text(
                          "${detail.createdDate!.day}/${detail.createdDate!.month}/${detail.createdDate!.year}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ],
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

                    ApproveMessage(approve: _approve),
                    SizedBox(
                      height: 20,
                    ),

                    CompletedMessage(completedMessage: _completedMessage),

                    const SizedBox(
                      height: 40,
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
}

class CompletedMessage extends StatelessWidget {
  const CompletedMessage({
    Key? key,
    required Future<CompletedModel>? completedMessage,
  })  : _completedMessage = completedMessage,
        super(key: key);

  final Future<CompletedModel>? _completedMessage;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CompletedModel>(
        future: _completedMessage,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error ${snapshot.error}"),
            );
          }

          if (snapshot.hasData) {
            var complete = snapshot.data!.payload;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Complete Message :",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: "Poppins",
                      ),
                    ),
                    Wrap(
                      children: List.generate(
                        complete!.length,
                        (index) =>
                            // ignore: prefer_const_literals_to_create_immutables
                            Text(
                          "${complete[index].createdDate!.day}/${complete[index].createdDate!.month}/${complete[index].createdDate!.year}",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.red,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: List.generate(
                    complete.length,
                    (index) => Text(
                      "${complete[index].note}",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: ThemeConstant.lightScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          return SizedBox();
        });
  }
}

// Class Message Approve
class ApproveMessage extends StatelessWidget {
  const ApproveMessage({
    Key? key,
    required Future<ApprovedModel>? approve,
  })  : _approve = approve,
        super(key: key);

  final Future<ApprovedModel>? _approve;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApprovedModel>(
      future: _approve,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error ${snapshot.error}",
            ),
          );
        }
        if (snapshot.hasData) {
          var approveMessage = snapshot.data!.payload;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Approve Message :",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Wrap(
                    children: List.generate(
                      approveMessage!.length,
                      (index) =>
                          // ignore: prefer_const_literals_to_create_immutables
                          Text(
                        "${approveMessage[index].createdDate!.day}/${approveMessage[index].createdDate!.month}/${approveMessage[index].createdDate!.year}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.red,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
               
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                children: List.generate(
                  approveMessage.length,
                  (index) => Text(
                    "${approveMessage[index].note}",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: ThemeConstant.lightScheme.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          );
        }
        return SizedBox();
      },
    );
  }
}
