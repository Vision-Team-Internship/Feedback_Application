// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, avoid_print, unnecessary_string_interpolations

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/archived_api/archived_message_api.dart';

import 'package:feedback_application_flutter/data/getdata/message_api.dart';
import 'package:feedback_application_flutter/model/archived_message_model.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:feedback_application_flutter/screens/empty_screen/empty_message_screen.dart';
import 'package:feedback_application_flutter/screens/home/my_home_screen.dart';
import 'package:feedback_application_flutter/screens/message/widgets/f_tile.dart';
import 'package:feedback_application_flutter/screens/message_detail/message_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  Future<FeedbackModel>? _messagemodel;
  // List<Payload>? _listmessage;
  Future<ArchivedMessageModel>? _archivedMessage;
  ArchivedMessageApi _archivedMessageApi = ArchivedMessageApi();
  MessageApi _messageApi = MessageApi();
  StreamSubscription? sub;
  bool isConnected = false;
  @override
  void initState() {
    sub = Connectivity().onConnectivityChanged.listen((event) {
      setState(() {
        isConnected = (event != ConnectivityResult.none);
      });
    });
    _messagemodel =
        _messageApi.readDataFromMessage('?isApproved=false&isRejected=false');
    super.initState();
  }

  @override
  void dispose() {
    sub!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Get.to(() => MyHomePage());
          },
          icon: Icon(
            Icons.arrow_back,
            size: 24,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        title: Text(
          "Message",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: RefreshIndicator(
          onRefresh: () async {
            print("Refresh");
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            child: FutureBuilder<FeedbackModel>(
              future: _messagemodel,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Please try again"),
                  );
                }
                if (snapshot.hasData) {
                  var _listmessage = snapshot.data!.payload;
                  return _listmessage!.isNotEmpty
                      ? _buildBody(context, _listmessage)
                      : EmptyMessageScreen();
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
      ),
    );
  }

  _buildBody(BuildContext context, var _listmessage) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        SvgPicture.asset(
          "assets/icon_background/message_icon.svg",
        ),
        const SizedBox(height: 23),
         Text(
          "Message Feedback",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
             color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        Text(
          "Timeline of when recieved request",
          style: ThemeConstant.textTheme.bodyText2!.copyWith(
            color: ThemeConstant.lightScheme.secondary,
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        ListView.builder(
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _listmessage!.length,
          itemBuilder: (context, index) {
            if (_listmessage![index].isApproved == false &&
                _listmessage![index].isRejected == false &&
                _listmessage![index].isCompleted == false) {
              return InkWell(
                onLongPress: () {
                  print(_listmessage![index].id.toString());
                  // _archivedMessageApi
                  //     .makeArchivedApi(_listmessage?[index].id.toString());
                },
                onTap: () {
                  Get.to(
                    () => MessageDetailScreen(
                      title: "${_listmessage![index].title}",
                      date:
                          '${_listmessage![index].createdDate!.day}/${_listmessage![index].createdDate!.month}/${_listmessage![index].createdDate!.year}',
                      level: '${_listmessage![index].feedbackLevel}',
                      id: _listmessage![index].id.toString(),
                      managerContact: [
                        _listmessage![index].managerContact,
                      ],
                    ),
                  )!
                      .then((value) {
                    _messagemodel = _messageApi.readDataFromMessage(
                        '?isApproved=false&isRejected=false');
                    print("setState Message");
                  });
                },
                child: FTile(
                  title: "${_listmessage![index].title}",
                  date: "",
                  floor:
                      " Request date: ${_listmessage![index].createdDate!.day}/${_listmessage![index].createdDate!.month}/${_listmessage![index].createdDate!.year}",
                  level: "${_listmessage![index].feedbackLevel}",
                  levelColor:
                      _listmessage![index].feedbackLevel?.toUpperCase() ==
                              "high".toUpperCase()
                          ? Colors.red
                          : _listmessage?[index].feedbackLevel?.toUpperCase() ==
                                  "medium".toUpperCase()
                              ? Color(0xffCACA03)
                              : Color(0xff00C700),
                ),
              );
            }
            return SizedBox();
          },
        ),
      ],
    );
  }
}
