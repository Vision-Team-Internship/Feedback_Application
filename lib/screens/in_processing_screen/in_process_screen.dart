// ignore_for_file: avoid_print, prefer_const_constructors

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:feedback_application_flutter/constants/theme_constant.dart';

import 'package:feedback_application_flutter/data/getdata/message_api.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:feedback_application_flutter/screens/home/my_home_screen.dart';
import 'package:feedback_application_flutter/screens/in_processing_screen/in_process_detail_screen.dart';
import 'package:feedback_application_flutter/screens/message/widgets/f_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class InProcessingScreen extends StatefulWidget {
  const InProcessingScreen({Key? key}) : super(key: key);

  @override
  _InProcessingScreenState createState() => _InProcessingScreenState();
}

class _InProcessingScreenState extends State<InProcessingScreen> {
  Future<FeedbackModel>? _messagemodel;
  List<Payload>? _listmessage;
  final MessageApi _messageApi = MessageApi();
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
        _messageApi.readDataFromMessage('?isApproved=true&isCompleted=false');
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
            color: Get.isDarkMode ? Colors.white : Colors.black,
            size: 24,
          ),
        ),
        title: Text(
          "In Process",
          style: TextStyle(
            fontFamily: "Poppins",
            color: Get.isDarkMode ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: RefreshIndicator(
        backgroundColor: Colors.black,
        color: Colors.white,
        onRefresh: () async {
          setState(() {
            sub = Connectivity().onConnectivityChanged.listen((event) {
              setState(() {
                isConnected = (event != ConnectivityResult.none);
                _messagemodel = _messageApi
                    .readDataFromMessage('?isApproved=true&isCompleted=false');
              });
            });
            _messagemodel = _messageApi
                .readDataFromMessage('?isApproved=true&isCompleted=false');
          });
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
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
                  _listmessage = snapshot.data!.payload;
                  return _listmessage!.isNotEmpty
                      ? _buildBody(context)
                      : Center(
                          child: Text("Empty"),
                        );
                }
                return Container(
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    height: 200,
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

  _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        SvgPicture.asset(
          "assets/icon_background/in_processing_icon.svg",
        ),
        const SizedBox(height: 23),
        Text(
          "In Processing Work",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        Text(
          "We are working on their tasks",
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
            if (_listmessage![index].isApproved == true &&
                _listmessage![index].isRejected == false &&
                _listmessage![index].isCompleted == false) {
              return InkWell(
                onTap: () {
                  Get.to(
                    () => DetailMessageInProcess(
                      title: '${_listmessage![index].title}',
                      dateTime:
                          '${_listmessage![index].createdDate!.day}/${_listmessage![index].createdDate!.month}/${_listmessage![index].createdDate!.year}',
                      message: '${_listmessage![index].message}',
                      id: '${_listmessage![index].id}',
                      level: '${_listmessage![index].feedbackLevel}',
                    ),
                  );
                },
                child: FTile(
                  title: "${_listmessage![index].title}",
                  date: "",
                  floor:
                      " Request date: ${_listmessage![index].createdDate!.day}/${_listmessage![index].createdDate!.month}/${_listmessage![index].createdDate!.year}",
                  level: "${_listmessage![index].feedbackLevel}",
                  levelColor:
                      _listmessage![index].feedbackLevel!.toUpperCase() ==
                              "high".toUpperCase()
                          ? Colors.red
                          : _listmessage![index].feedbackLevel!.toUpperCase() ==
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
