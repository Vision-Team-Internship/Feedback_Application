// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields, avoid_print

import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/message_api.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
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
  List<Payload>? _listmessage;
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
    _messagemodel = _messageApi.readDataFromMessage();
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
            size: 24,
          ),
        ),
        title: Text(
          "Message",
          style: const TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff000000),
            fontSize: 20,
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
                _messagemodel = _messageApi.readDataFromMessage();
              });
            });
            _messagemodel = _messageApi.readDataFromMessage();
          });
        },
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: 25),
            width: MediaQuery.of(context).size.width,
            //  height: MediaQuery.of(context).size.height,
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
                  return _buildBody(context);
                }
                return Center(
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
        // child: isConnected
        //     ? SingleChildScrollView(
        //         physics: BouncingScrollPhysics(),
        //         child: Container(
        //           alignment: Alignment.topLeft,
        //           padding: EdgeInsets.symmetric(horizontal: 25),
        //           width: MediaQuery.of(context).size.width,
        //           //  height: MediaQuery.of(context).size.height,
        //           child: FutureBuilder<MessageModel>(
        //             future: _messagemodel,
        //             builder: (context, snapshot) {
        //               if (snapshot.hasError) {
        //                 return Center(
        //                   child: Text("Please try again"),
        //                 );
        //               }
        //               if (snapshot.hasData) {
        //                 _listmessage = snapshot.data!.payload;
        //                 return _buildBody(context);
        //               }
        //               return Center(
        //                 child: SizedBox(
        //                   width: 200,
        //                   height: 200,
        //                   child: Lottie.asset("assets/loadings/waiting.json"),
        //                 ),
        //               );
        //             },
        //           ),
        //         ),
        //       )

        //     : Center(
        //         child: Text("Disconnect"),
        //       ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        SvgPicture.asset(
          "assets/icon_background/message_icon.svg",
        ),
        const SizedBox(height: 23),
        const Text(
          "Message Feedback",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            fontFamily: "Poppins",
            color: Colors.black,
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
                _listmessage![index].isRejected == false) {
              return InkWell(
                onTap: () {
                
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

// FutureBuilder<MessageModel>(
//             builder: (context, snapshot) {
//               if (snapshot.hasError) {
//                 print("Error While reading data from API: ${snapshot.error}");
//                 return Center(
//                   child: Text("Has Error Please try again"),
//                 );
//               }
//               if (snapshot.connectionState == ConnectionState.done) {
//                 _listmessage = snapshot.data!.payload;
//                 print(_listmessage);
              
//               }

//               return SizedBox();
//             },
//           ),
        


  // return Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   const SizedBox(height: 20),
  //                   SvgPicture.asset(
  //                     "assets/icon_background/message_icon.svg",
  //                   ),
  //                   const SizedBox(height: 23),
  //                   const Text(
  //                     "Message Feedback",
  //                     style: TextStyle(
  //                       fontSize: 24,
  //                       fontWeight: FontWeight.w600,
  //                       fontFamily: "Poppins",
  //                       color: Colors.black,
  //                     ),
  //                   ),
  //                   Text(
  //                     "Timeline of when recieved request",
  //                     style: ThemeConstant.textTheme.bodyText2!.copyWith(
  //                       color: ThemeConstant.lightScheme.secondary,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     height: 50,
  //                   ),
  //                   FTile(
  //                     onTap: () {
  //                       Get.to(MessageDetailScreen());
  //                     },
  //                     title: 'Not enough Water',
  //                     floor: 'F1>IT>Room102',
  //                     level: 'High',
  //                     date: '02/11/2022',
  //                     levelColor: Colors.red,
  //                   ),
  //                   const FTile(
  //                     title: 'Not enough Water',
  //                     floor: 'F1>IT>Room102',
  //                     level: 'Medium',
  //                     date: '02/11/2022',
  //                     levelColor: Color(0xffDEDE22),
  //                   ),
  //                   const FTile(
  //                     title: 'Not enough Water',
  //                     floor: 'F1>IT>Room102',
  //                     level: 'Low',
  //                     date: '02/11/2022',
  //                     levelColor: Color(0xff00C700),
  //                   ),
  //                   const FTile(
  //                     title: 'Not enough Water',
  //                     floor: 'F1>IT>Room102',
  //                     level: 'High',
  //                     date: '02/11/2022',
  //                     levelColor: Colors.red,
  //                   ),
  //                   const FTile(
  //                     title: 'Not enough Water',
  //                     floor: 'F1>IT>Room102',
  //                     level: 'Medium',
  //                     date: '02/11/2022',
  //                     levelColor: Color(0xffDEDE22),
  //                   ),
  //                   const FTile(
  //                     title: 'Not enough Water',
  //                     floor: 'F1>IT>Room102',
  //                     level: 'Low',
  //                     date: '02/11/2022',
  //                     levelColor: Color(0xff00C700),
  //                   ),
  //                 ],
  //               );
            