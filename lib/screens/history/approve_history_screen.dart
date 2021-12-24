// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_string_interpolations, unused_field

import 'package:feedback_application_flutter/constants/theme_constant.dart';
import 'package:feedback_application_flutter/data/deletedata/delete_history_message.dart';
import 'package:feedback_application_flutter/data/getdata/message_api.dart';
import 'package:feedback_application_flutter/model/message_model.dart';
import 'package:feedback_application_flutter/model/slidable_action.dart';
import 'package:feedback_application_flutter/screens/history/detail_approve_message_screen.dart';
import 'package:feedback_application_flutter/screens/history/detail_reject_message_screen.dart';
import 'package:feedback_application_flutter/screens/message/widgets/f_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class ApproveHistoryScreen extends StatefulWidget {
  const ApproveHistoryScreen({Key? key}) : super(key: key);

  @override
  _ApproveHistoryScreenState createState() => _ApproveHistoryScreenState();
}

class _ApproveHistoryScreenState extends State<ApproveHistoryScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  Future<FeedbackModel>? _approve;


  final MessageApi _messageApi = MessageApi();
  final DeleteMessage _deleteMessage = DeleteMessage();

  @override
  void initState() {
    _approve =
        _messageApi.readDataFromMessage('?isApproved=true&isCompleted=true');
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
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
          "Messge History",
          style: const TextStyle(
            fontFamily: "Poppins",
            color: Color(0xff000000),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              child: TabBar(
                controller: _tabController,
                indicator: BoxDecoration(
                  color: ThemeConstant.lightScheme.primary,
                ),
                physics: BouncingScrollPhysics(),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                labelStyle: ThemeConstant.textTheme.subtitle1!
                    .copyWith(color: Colors.white),
                tabs: [
                  Tab(
                    text: 'Done',
                  ),
                  Tab(
                    text: 'Reject',
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  _buildFirstTab(context),
                  // second tab bar view widget
                  _buildSecondTab(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void isDississed(int index, SlidableAction action, String title) {
    switch (action) {
      case SlidableAction.more:
        Get.snackbar(
          "Processing",
          "Hello everyone",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
          //  dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        break;
      case SlidableAction.delete:
        Get.snackbar(
          "Deleted",
          "$title has been deleted",
          icon: Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Color(0xff2F2F2F),
          borderRadius: 20,
          margin: EdgeInsets.all(15),
          colorText: Colors.white,
          duration: Duration(seconds: 4),
          isDismissible: true,
          //   dismissDirection: SnackDismissDirection.HORIZONTAL,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        break;

      default:
    }
  }

  _buildFirstTab(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<FeedbackModel>(
        future: _approve,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error fetch data"),
            );
          }
          if (snapshot.hasData) {
           var _listApprove = snapshot.data!.payload;
            return _listApprove!.isNotEmpty
                ? ListView.builder(
                    itemCount: _listApprove.length,
                    itemBuilder: (context, index) {
                      return _listApprove[index].isCompleted == true &&
                              _listApprove[index].isRejected == false
                          ? Slidable(
                              key: Key("${_listApprove[index].title}"),
                              actionPane: SlidableDrawerActionPane(),
                              secondaryActions: <Widget>[
                                IconSlideAction(
                                  caption: 'More',
                                  color: Colors.black45,
                                  icon: Icons.more_horiz,
                                  onTap: () {
                                    isDississed(index, SlidableAction.more,
                                        _listApprove[index].title.toString());
                                    print("More Option Done message");
                                  },
                                ),
                                IconSlideAction(
                                  caption: 'Delete',
                                  color: Colors.red,
                                  icon: CupertinoIcons.multiply_circle,
                                  onTap: () {
                                    print("Delete Option in Done messaage");
                                    isDississed(index, SlidableAction.delete,
                                        _listApprove[index].title.toString());
                                    // _approve =
                                    //     _deleteMessage.deleteHistoryMessage(
                                    //         _listApprove![index].id.toString());

                                    // setState(() {
                                    //   _approve =
                                    //       _messageApi.readDataFromMessage();
                                    // });
                                  },
                                ),
                              ],
                              child: FTile(
                                onTap: () {
                                  Get.to(
                                    () => DetailApproveMessageScreen(
                                      id: _listApprove[index].id.toString(),
                                      level: _listApprove[index]
                                          .feedbackLevel
                                          .toString(),
                                      title:
                                          _listApprove[index].title.toString(),
                                      date: '',
                                      managerContact: [],
                                    ),
                                  );
                                },
                                title: "${_listApprove[index].title}",
                                floor:
                                    "Date: ${_listApprove[index].createdDate!.day}/${_listApprove[index].createdDate!.month}/${_listApprove[index].createdDate!.year}",
                                level: "${_listApprove[index].feedbackLevel}",
                                date: "",
                                levelColor:
                                    "${_listApprove[index].feedbackLevel}"
                                                .toUpperCase() ==
                                            "HIGH"
                                        ? Colors.red
                                        : "${_listApprove[index].feedbackLevel}"
                                                    .toUpperCase() ==
                                                "Medium".toUpperCase()
                                            ? Color(0xffDEDE22)
                                            : Color(0xff00C700),
                              ),
                            )
                          : SizedBox();
                    },
                  )
                : Center(
                    child: Text("Empty"),
                  );
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
    );
  }

  _buildSecondTab(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: MediaQuery.of(context).size.width,
      child: FutureBuilder<FeedbackModel>(
        future: _approve,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error fetch data"),
            );
          }
          if (snapshot.hasData) {
           var _listApprove = snapshot.data!.payload;
            if (_listApprove!.isEmpty) {
              return Center(
                child: Text("Empty"),
              );
            } else {
              return ListView.builder(
                itemCount: _listApprove.length,
                itemBuilder: (context, index) {
                  return _listApprove[index].isApproved == false &&
                          _listApprove[index].isRejected == true
                      ? Slidable(
                          key: Key("${_listApprove[index].title}"),
                          actionPane: SlidableDrawerActionPane(),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                                caption: 'More',
                                color: Colors.black45,
                                icon: Icons.more_horiz,
                                onTap: () {
                                  print("More Option in Reject message");
                                  isDississed(index, SlidableAction.more,
                                      _listApprove[index].title.toString());
                                }),
                            IconSlideAction(
                                caption: 'Delete',
                                color: Colors.red,
                                icon: CupertinoIcons.multiply_circle,
                                onTap: () {
                                  print("Delete Option in Reject message");
                                  isDississed(index, SlidableAction.delete,
                                      _listApprove[index].title.toString());
                                }),
                          ],
                          child: FTile(
                            onTap: () {
                              Get.to(
                                () => DetailRejectMessageScreen(
                                  id: '${_listApprove[index].id}',
                                  date:
                                      '${_listApprove[index].createdDate!.day}/${_listApprove[index].createdDate!.month}/${_listApprove[index].createdDate!.year}',
                                  level:
                                      '${_listApprove[index].feedbackLevel}',
                                  title: '${_listApprove[index].title}',
                                ),
                              );
                            },
                            title: "${_listApprove[index].title}",
                            floor:
                                "Date: ${_listApprove[index].createdDate!.day}/${_listApprove[index].createdDate!.month}/${_listApprove[index].createdDate!.year}",
                            level: "${_listApprove[index].feedbackLevel}",
                            date: "",
                            levelColor: "${_listApprove[index].feedbackLevel}"
                                        .toUpperCase() ==
                                    "HIGH"
                                ? Colors.red
                                : "${_listApprove[index].feedbackLevel}"
                                            .toUpperCase() ==
                                        "Medium".toUpperCase()
                                    ? Color(0xffDEDE22)
                                    : Color(0xff00C700),
                          ),
                        )
                      : SizedBox();
                },
              );
            }
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
    );
  }
}
