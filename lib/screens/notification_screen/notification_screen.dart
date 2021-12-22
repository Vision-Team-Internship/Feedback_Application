// ignore_for_file: prefer_const_constructors, must_be_immutable, avoid_print, prefer_final_fields, prefer_const_literals_to_create_immutables
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/notification/mark_as_read_api.dart';
import 'package:feedback_application_flutter/data/notification/notification_api.dart';
import 'package:feedback_application_flutter/model/mark_as_read_model.dart'
    as mark;
import 'package:feedback_application_flutter/model/notification_model.dart';
import 'package:feedback_application_flutter/screens/message_detail/message_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  Future<NotificationModel>? notificationmodel;
  List<Payload>? _listNotification;
  Future<mark.MarkAsReadModel>? markAsreadmodel;
  MarkAsReadApi _markAsReadApi = MarkAsReadApi();
  NotificationApi _notificationApi = NotificationApi();

  @override
  initState() {
    notificationmodel = _notificationApi.readDataFromNotification();
    // markAsreadmodel = _markAsReadApi.markAsRead();
    // print("Mark as Read ${markAsreadmodel.toString()}");
    super.initState();
  }

  String formattedDate(timeStamp) {
    var dateFromTimeStamp =
        DateTime.fromMillisecondsSinceEpoch(timeStamp.seconds * 1000);
    return DateFormat('dd-MM-yyyy hh:mm a').format(dateFromTimeStamp);
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
          "Notification",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontFamily: "Poppins",
          ),
        ),
        actions: [
          Row(
            children: [
              SvgPicture.asset("assets/icons/mark_ask_done.svg"),
              SizedBox(
                width: 4,
              ),
              TextButton(
                style: ButtonStyle(),
                onPressed: () {
                  markAsreadmodel = _markAsReadApi.markAsRead().then((value) {
                    setState(() {
                      notificationmodel =
                          _notificationApi.readDataFromNotification();
                    });
                    print("mark as read done");
                    return value;
                  });
                },
                child: Text(
                  "Mark as read",
                  style: ThemeConstant.textTheme.subtitle2!
                      .copyWith(color: ThemeConstant.lightScheme.primary),
                ),
              ),
              SizedBox(
                width: 18,
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: FutureBuilder<NotificationModel>(
            future: notificationmodel,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              if (snapshot.hasData) {
                _listNotification = snapshot.data!.payload;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _listNotification?.length,
                    itemBuilder: (context, index) {
                      DateTime now = DateTime.parse(
                          "${_listNotification?[index].notificationDate}");
                      var datetime = DateFormat.jm().format(now);

                      return Column(
                        children: [
                          Material(
                            color: _listNotification![index].isClick == false
                                ? Color(0xffEEEEEE)
                                : null,
                            child: InkWell(
                              onTap: () async {
                                Get.to(
                                  () => MessageDetailScreen(
                                    title:
                                        "${_listNotification?[index].feedbackId?.title}",
                                    date:
                                        "${_listNotification?[index].notificationDate!.day}/${_listNotification?[index].notificationDate!.month}/${_listNotification?[index].notificationDate!.year}",
                                    level:
                                        "${_listNotification?[index].feedbackId?.feedbackLevel}",
                                    id: "${_listNotification?[index].feedbackId?.id}",
                                    managerContact: [],
                                  ),
                                )!
                                    .then(
                                  (value) {
                                    setState(
                                      () {
                                        notificationmodel = _notificationApi
                                            .readDataFromNotification();
                                      },
                                    );
                                  },
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${_listNotification?[index].feedbackId?.title}",
                                          style: ThemeConstant
                                              .textTheme.headline6!
                                              .copyWith(
                                            color: Colors.black,
                                          ),
                                        ),
                                        _listNotification![index].isClick ==
                                                false
                                            ? CircleAvatar(
                                                radius: 5,
                                                backgroundColor: ThemeConstant
                                                    .lightScheme.primary,
                                              )
                                            : SizedBox(),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .75,
                                        child: Text(
                                          "${_listNotification?[index].feedbackId?.message}",
                                          style: ThemeConstant
                                              .textTheme.subtitle2!
                                              .copyWith(
                                            color: ThemeConstant
                                                .lightScheme.secondary,
                                            fontWeight: FontWeight.w400,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        "${_listNotification?[index].notificationDate?.day}/${_listNotification?[index].notificationDate?.month}/${_listNotification?[index].notificationDate?.year},  $datetime ",
                                        style: ThemeConstant.textTheme.caption!
                                            .copyWith(
                                          color: ThemeConstant
                                              .lightScheme.secondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .02,
                          ),
                        ],
                      );
                    },
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: SizedBox(
                  width: 180,
                  height: 180,
                  child: Lottie.asset("assets/loadings/waiting.json"),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Mark as Read on Notification

  Future<NotificationModel?> markAsread(String id, bool isClicked) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var token = pref.getString("login");
    http.Response response = await http.put(
      Uri.parse(
        "https://feedback-project-api.herokuapp.com/api/v1/feedback/notifications/61b2c2a63a29fd6e1b774711",
      ),
      headers: <String, String>{
        "auth-token": '$token',
        "Content-Type": "application/json",
      },
      body: (<String, bool>{'isClick': true}),
    );

    if (response.statusCode == 200) {
      // return ApprovedModel.fromJson(jsonDecode(response.body));
      final String data = response.body;
      return notificationModelFromJson(data);
    } else {
      return null;
    }
  }
}
